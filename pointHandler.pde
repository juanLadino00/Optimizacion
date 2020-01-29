void createPointCloud(int cloudSize){
 points = new float[0][0];
 for(int i=0;i<cloudSize;i++){
  float x = (float) random(width*0.05,width*0.95);
  float y = (float) random(height*0.05,height*0.95);
  points = (float[][]) PApplet.append(points,new float[]{x,y});
 }
 println("cloud created: "+points.length);
}
void calculateConvexElements(){
  //create convex null
  Hull myConvexHull = new Hull(points);
  hullVertices = myConvexHull.getExtrema();
  //create delaunay triangulation
  Delaunay myDelaunay = new Delaunay(points);
  triangulationEdges = myDelaunay.getLinks();
  
}
