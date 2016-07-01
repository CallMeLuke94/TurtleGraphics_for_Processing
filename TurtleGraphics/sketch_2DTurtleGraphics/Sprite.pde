//Draw a turtle here!

void sprite(float scl) {
  scale(scl);
  strokeWeight(1);
  stroke(0);
  fill(#06C63E);
  ellipse (-25, -17, 28, 20);    //legs
  ellipse (25, -17, 28, 20);
  ellipse (-25, 17, 28, 20);
  ellipse (25, 17, 28, 20); 
  fill(#06C63E);
  triangle (0, 48, -7, 38, 7, 38);      //tail
  fill(#008928);
  ellipse(0, 0, 50, 80);    //body
  ellipse(0, -40, 40, 45);     //head
  fill(0, 0, 0);
  ellipse (-20, -50, 10, 10);    //eyes
  ellipse (20, -50, 10, 10);
}