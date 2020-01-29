void plotConvexCombination(PVector p1, PVector p2){
 for(int i=0;i<=lineResolution;i++){
  float t = (float) i / (float) (lineResolution);
  PVector p = PVector.add(PVector.mult(p1,1-t),PVector.mult(p2,t));
  stroke(lerpColor(color(255,0,0),color(0,0,255),t));
  point(p.x,p.y);
 }
}
