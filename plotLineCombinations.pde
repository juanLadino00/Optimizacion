import megamu.mesh.*;
PVector[] points;
int[] selected;
int[][] lineSegments;
int pointRadius = 5;
int lineResolution = 100;
void setup(){
 size(800,500,P3D);
 rectMode(CENTER);
 points = new PVector[0];
 lineSegments = new int[0][0];
 selected = new int[]{-1,-1};
}
void mousePressed(){
 if(mouseButton == LEFT){ 
  points = (PVector[]) PApplet.append(points, new PVector(mouseX,mouseY));
 }else if(mouseButton == RIGHT){
  int selectedIndex = closestPointIndex(new PVector(mouseX,mouseY));
  if(selectedIndex != -1){
   if(selected[0] == -1 && selected[1] != -1){
    selected[0] = selectedIndex;
   }
   if(selected[0] != 0 && selected[1] == -1){
    selected[1] = selectedIndex;
   }
   if(selected[0] != -1 && selected[1] != -1){
    lineSegments = (int[][]) PApplet.append(lineSegments,new int[]{selected[0],selected[1]});
    selected = new int[]{-1,-1};
   }
  }
 }
}
void draw(){
 background(255);
 stroke(0);
 strokeWeight(1);
 for(int i=0;i<points.length;i++){
  if(i == selected[0] || i==selected[1]){
   fill(0,0,255);
  }else{
   fill(255,0,0);
  }
  rect(points[i].x,points[i].y,pointRadius,pointRadius);
 }
 for(int i=0;i<lineSegments.length;i++){
  int i0 = lineSegments[i][0];
  int i1 = lineSegments[i][1];
  strokeWeight(2);
  plotConvexCombination(points[i0], points[i1]);
 }
}
