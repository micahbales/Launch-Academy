function Circle(radius, x, y) {
  this.radius = radius;
  this.x = x || 0;
  this.y = y || 0;
  this.area = function() { return Math.PI * Math.pow(radius, 2) };
}
