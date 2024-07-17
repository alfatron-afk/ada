#include <stdio.h>
#include <limits.h>

#define MAX 10
#define INF INT_MAX

void dijkstra(int G[MAX][MAX], int n, int startnode) {
    int cost[MAX][MAX], distance[MAX], pred[MAX];
    int visited[MAX], count, mindistance, nextnode, i, j;

    for (i = 0; i < n; i++)
        for (j = 0; j < n; j++)
            if (G[i][j] == 0)
                cost[i][j] = INF;
            else
                cost[i][j] = G[i][j];

    for (i = 0; i < n; i++) {
        distance[i] = cost[startnode][i];
        pred[i] = startnode;
        visited[i] = 0;
    }

    distance[startnode] = 0;
    visited[startnode] = 1;
    count = 1;

    while (count < n - 1) {
        mindistance = INF;

        for (i = 0; i < n; i++)
            if (distance[i] < mindistance && !visited[i]) {
                mindistance = distance[i];
                nextnode = i;
            }

        visited[nextnode] = 1;
        for (i = 0; i < n; i++)
            if (!visited[i])
                if (mindistance + cost[nextnode][i] < distance[i]) {
                    distance[i] = mindistance + cost[nextnode][i];
                    pred[i] = nextnode;
                }
        count++;
    }

    for (i = 0; i < n; i++)
        if (i != startnode) {
            printf("\nDistance from node%d to node%d is %d", startnode, i, distance[i]);
            printf("\nPath=%d", i);
            j = i;
            do {
                j = pred[j];
                printf("<-%d", j);
            } while (j != startnode);
        }
}

int main() {
    int G[MAX][MAX], i, j, n, u;
    printf("Enter no. of vertices: ");
    scanf("%d", &n);
    printf("\nEnter the adjacency matrix:\n");
    for (i = 0; i < n; i++)
        for (j = 0; j < n; j++)
            scanf("%d", &G[i][j]);
    printf("\nEnter the starting node: ");
    scanf("%d", &u);
    dijkstra(G, n, u);
    return 0;
}
Sample Input and Output:
Enter the no.of vertices:5 
Enter the cost matrix
0 3 1 999 999
3 0 7 5 1
1 7 0 2 999
999 5 2 0 7
999 1 999 7 0
Enter the source vertex:0
the shortest distance is...Cost from 0 to 0 is 0 
Cost from 0 to 1 is 3
Cost from 0 to 2 is 1
Cost from 0 to 3 is 3
Cost from 0 to 4 is 4
