ArrayList<Particle> particles;

void setup() {
  size(600, 400);
  particles = new ArrayList<>();
  
  for (int i = 0; i < 100; i++) {
    particles.add(new Particle(random(width), random(height)));
  }
}

void draw() {
  background(0);

  for (Particle p : particles) {
    p.update();
    p.display();
  }
}

class Particle {
  float x, y;
  float speedX, speedY;
  float diameter;
  int particleColor;

  Particle(float x, float y) {
    this.x = x;
    this.y = y;
    speedX = random(-1, 1);
    speedY = random(-1, 1);
    diameter = random(5, 15);
    particleColor = color(random(255), random(255), random(255), 150);
  }

  void update() {
    x += speedX;
    y += speedY;

    if (x > width || x < 0) {
      speedX *= -1;
    }
    if (y > height || y < 0) {
      speedY *= -1;
    }
  }

  void display() {
    noStroke();
    fill(particleColor);
    ellipse(x, y, diameter, diameter);
  }
}
