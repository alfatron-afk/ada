#include<stdio.h> 
#include<stdlib.h> 
#include<time.h>
int count=0;
void merge(int a[], int low,int mid,int high)
{
int i,j,k,c[10000];
i=low, j=mid+1, k=0; 
while((i<=mid) && (j<=high))
{
count++;
//choose the least element and store in Temporary array 'C' 
if(a[i]<a[j])
c[k++]=a[i++];
else
}
c[k++]=a[j++];
//Copy the remaining array elements from any one of sub-array 
while(i<=mid)
c[k++]=a[i++];
while(j<=high)
c[k++]=a[j++];
for(i=low,j=0;j<k;i++, j++) 
a[i]=c[j];
}
void merge_sort(int a[], int low, int high)
{
int mid; 
if(low < high)
{
//Divide the given array into 2 parts 
mid=(low+high)/2; 
merge_sort(a,low,mid); 
merge_sort(a,mid+1,high); 
merge(a,low,mid,high);
}
}
int main()
{
int a[10000],n,i;
printf("Enter the number of elements in an array:"); 
scanf("%d",&n);
printf("All the elements:");
srand(time(0)); 
for(i=0;i<n;i++)
{
a[i]=rand(); 
printf("%d ",a[i]);
}
merge_sort(a,0,n-1); 
printf("\nAftersorting\n"); 
for(i=0;i<n;i++)
printf("%d ", a[i]);
printf("\nNumber of basic operations = %d\n",count);
}

Sample Input and Output:
Enter the number of elements in an array:5All 
the elements:
24759 329 8704 24132 7473
After sorting
329 7473 8704 24132 24759
Number of basic operations = 8
Enter the number of elements in an array:10All 
the elements:
24854 17121 2477 1072 11684 5437 26057 1167 17322 3583
After sorting
1072 1167 2477 3583 5437 11684 17121 17322 24854 26057
Number of basic operations = 22
