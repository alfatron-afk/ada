#include<stdio.h> 
#include<stdlib.h> 
#include<time.h>
int count=0;
int partition(int a[], int low,int high)
{
int pivot=a[low],temp,i=low+1,j=high; 
while(1)
{
//Traverse i from left to right, segregating element of left group
while(i<=high && a[i]<=pivot)//a[i]<=pivot used for avoiding multiple duplicates
{
i++; count++;
}
//Traverse j from right to left, segregating element of right group 
while(j>0 && a[j]>pivot)
{
j--; count++;
}
count+=2;
//If grouping is incomplete 
if(i<j)
{
temp = a[i]; 
a[i] = a[j]; 
a[j] =temp;
}
else if(i>j)//If grouping is completed
{
temp = a[low]; 
a[low] = a[j]; 
a[j] = temp; 
return j;
}
else //Duplicate of Pivot found 
return j;
}
}
void quicksort(int a[],int low, int high)
{
int s; 
if(low<high)
{
//partition to place pivot element in between left and right group 
s = partition(a,low,high);
quicksort(a,low,s-1); 
quicksort(a,s+1,high);
}
}
int main()
{
int a[10000],n;
printf("Enter the number of elements in an array:"); 
scanf("%d",&n);
printf("All the elements:"); 
srand(time(0));
for(int i=0;i<n;i++)
{
a[i]=rand(); 
printf("%d ",a[i]);
}
quicksort(a,0,n-1); 
printf("\nAftersorting\n"); 
for(int i=0;i<n;i++)
printf("%d ", a[i]);
printf("\nNumber of basic operations = %d\n",count);
}

Sample Input and Output:
Enter the number of elements in an array:5All 
the elements:
24442 6310 12583 16519 22767
After sorting
6310 12583 16519 22767 24442
Number of basic operations = 18
Enter the number of elements in an array:10All 
the elements:
24530 1605 3396 10868 6349 9906 12836 28823 21075 22418
After sorting
1605 3396 6349 9906 10868 12836 21075 22418 24530 28823
Number of basic operations = 44
