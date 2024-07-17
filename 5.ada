#include <stdio.h>

int n, adj[10][10], visited[10], stack[10], top = -1;

void dfs(int v) {
    visited[v] = 1;
    for (int i = 0; i < n; i++)
        if (adj[v][i] && !visited[i])
            dfs(i);
    stack[++top] = v;
}

void main() {
    printf("Enter no. of vertices: ");
    scanf("%d", &n);
    printf("Enter adjacency matrix:\n");
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            scanf("%d", &adj[i][j]);
    for (int i = 0; i < n; i++)
        visited[i] = 0;
    for (int i = 0; i < n; i++)
        if (!visited[i])
            dfs(i);
    printf("Topological Order: ");
    while (top != -1)
        printf("%d ", stack[top--]);
}
Sample Input and Output:
Enter no. of Vertices: 5 
Enter the cost matrix
0 1 1 0 0
0 0 0 1 1
0 0 0 1 0
0 0 0 0 1
0 0 0 0 0
Topological ordering is:0 1 2 3 4
