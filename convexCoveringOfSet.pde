import megamu.mesh.*;

int numPoints = 20;
float[][] points;
int[] hullVertices;
int[][] triangulationEdges;
boolean showConvexHull = false;
boolean showPolygons = false;
boolean showTriangulation = false;
boolean showLineas = false;
int selectedVertex = -1;
float pointRadius =5;
void setup() {
  size(800, 600);
  rectMode(CENTER);
  createPointCloud(numPoints);
  calculateConvexElements();
}
void mouseDragged() {
  int selected = closestIndex(mouseX, mouseY);
  if (selected != -1) {
    points[selected][0] += (mouseX-pmouseX);
    points[selected][1] += (mouseY-pmouseY);
  }
}
void mouseReleased() {
  calculateConvexElements();
}
void keyPressed() {
  if (key == 'n' || key == 'N') {
    createPointCloud(numPoints);
    calculateConvexElements();
  }
  if (key == 'h' || key == 'H') {
    if (!showConvexHull) {
      showConvexHull = true;
    } else {
      showConvexHull = false;
    }
  }
  if (key == 'p' || key == 'P') {
    if (!showPolygons) {
      showPolygons = true;
    } else {
      showPolygons = false;
    }
  }
  if(key == 't' || key == 'T'){
   if(!showTriangulation){
    showTriangulation = true;
   }else{
    showTriangulation = false;
   }

  }
  if(key == 'l' || key == 'L'){
   if(!showLineas){
    showLineas = true;
   }else{
    showLineas = false;
   }

  }
}
void draw() {
  background(255);
  strokeWeight(1);
  if (showPolygons) {
    stroke(255, 0, 0, 50);
    plotAllLineSegments();
    //plotAllTriangles();
  }
  if(showLineas){
   stroke(255,255,0);
   plotAllLineSegments();
  }
  fill(255, 0, 0);
  stroke(0);
  plotCloud();
  if (showConvexHull) {
    fill(150,150);
    stroke(0);
    strokeWeight(2);
    plotConvexHull();
  }
  if(showTriangulation){
   stroke(255,0,0);
   strokeWeight(2);
   plotTriangulation();
  }
}
