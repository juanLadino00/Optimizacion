int closestPointIndex(PVector p){
 int closest = -1;
 for(int i=0;i<points.length && closest == -1;i++){
  if(points[i].dist(p)<2*pointRadius){
   closest = i;
  }
 }
 return closest;
}
