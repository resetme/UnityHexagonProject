using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class MeshInfo {
    public Vector3[] surfaceNormals;
    public Vector3[] newVertices;
    public int[] randoms;
    public float maxDist = 20;
    public Mesh myMesh;
    public Vector2 rndValue;

    public MeshInfo(Mesh mesh, Vector2 randValue) {
        myMesh = mesh;
        rndValue = randValue;
        CreateMesh();
    }

    public void CreateMesh() {
        // Get mesh info from attached mesh
        //myMesh = GetComponent<MeshFilter>().mesh;
        Vector3[] myVertices = myMesh.vertices;
        int[] myTriangles = myMesh.triangles;
        Vector2[] myUV = myMesh.uv;
        Vector3[] myNormals = myMesh.normals;

        // Set up new arrays to use with rebuilt mesh
        newVertices = new Vector3[myTriangles.Length];
        Vector2[] newUV = new Vector2[myTriangles.Length];
        Vector3[] newNormals = new Vector3[myTriangles.Length];
        int[] newTriangles = new int[myTriangles.Length];

        // Rebuild mesh so that every triangle has unique vertices
        for (int i = 0; i < myTriangles.Length; i++)
        {
            newVertices[i] = myVertices[myTriangles[i]];
            newUV[i] = myUV[myTriangles[i]];
            newNormals[i] = myNormals[myTriangles[i]];
            newTriangles[i] = i;
        }

        // Assign new mesh
        myMesh.vertices = newVertices;
        myMesh.uv = newUV;
        myMesh.normals = newNormals;
        myMesh.triangles = newTriangles;

        // Get array of surface normals for each triangle
        surfaceNormals = new Vector3[myTriangles.Length / 3];

        // Create array of randoms
        randoms = new int[surfaceNormals.Length];

        var idx = 0;
        for (int i = 0; i < surfaceNormals.Length; i++)
        {
            var v0 = newVertices[idx++];
            surfaceNormals[i] = Vector3.Cross(newVertices[idx++] - (v0 * 2), newVertices[idx++] - v0).normalized; // *2 front and return

            randoms[i] = Random.Range((int)rndValue.x, (int)rndValue.y);
        }
    }
}


public class ExplodeMesh : MonoBehaviour {

    public float amount = 0.0f;
    MeshInfo[] newMesh;

    // Use this for initialization
    void Start () {

        newMesh = new MeshInfo[transform.childCount];
        for (int i = 0; i < newMesh.Length; i++)
        {
            newMesh[i] = new MeshInfo(transform.GetChild(i).GetComponent<MeshFilter>().mesh, new Vector2(Random.Range(2,15), Random.Range(2, 15)));
        }

    }

   
    void StartExplodeMesh (float amount)
    {
        for (int i = 0; i < transform.childCount; i++)
        {
            int idx = 0;
            Vector3[] thisVertices = newMesh[i].myMesh.vertices;

            for (int j = 0; j < newMesh[i].surfaceNormals.Length; j++)
            {
                thisVertices[idx] = newMesh[i].newVertices[idx++] + newMesh[i].surfaceNormals[j] * this.amount * newMesh[i].randoms[j];
                thisVertices[idx] = newMesh[i].newVertices[idx++] + newMesh[i].surfaceNormals[j] * this.amount * newMesh[i].randoms[j];
                thisVertices[idx] = newMesh[i].newVertices[idx++] + newMesh[i].surfaceNormals[j] * this.amount * newMesh[i].randoms[j];

            }

            newMesh[i].myMesh.vertices = thisVertices;
        }
        
    }

    // Update is called once per frame
    void Update () {
        StartExplodeMesh(amount);
    }
}
