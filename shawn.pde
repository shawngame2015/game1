/* @pjs preload="shawn1.png"; */
/* @pjs preload="shawn2.png"; */
/* @pjs preload="suzanne.png"; */
/* @pjs preload="heart2.png"; */
/* @pjs preload="eric.png"; */

int[] px = {100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100};
int[] py = {290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290};
int[] dx = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
int[] dy = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
var g = 0.4;
byte[] stop = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
byte go = 0;
ritsu = loadImage('shawn1.png');
rasa = loadImage('shawn2.png');
akiko = loadImage('suzanne.png');
heart = loadImage('heart2.png');
yoshi = loadImage('eric.png');
int score = 0;
int time = 294;

int ak = -20;
int apx = 100;
int apy = 283;
int adx = 0;
int ady = 0;
byte astop = 0;
boolean ht = false;
int hpy = 110;

int ysize = 108;
int ysized = -2;

boolean shot = false;

void setup() {
 size(320, 500);
 frameRate(24);
}


var draw() {
 if(score>99){
  background(233, 171, 23); 
  document.bgColor = "#E9AB17";
 }else{
  background(56, 172, 236);
  document.bgColor = "#38ACEC";
 }

 strokeWeight(3);
 stroke(255, 255, 255);

 

 if(mousePressed && time!=0 && shot){
  line(100, 290, mouseX, mouseY);
 }
 

  for(int i=23; i > -1; i--){
    dy[i] = dy[i] + g;
    px[i] = px[i] + dx[i];
    py[i] = py[i] + dy[i];

    if(py[i] > 290){
    py[i] = 290;
    dy[i] = dy[i] * -1;
    dy[i] = dy[i] * 0.4;
    dx[i] = dx[i] * 0.4;
    }
 
   // if(py[i] < 20){
   //   py[i] = 20;
   //   dy[i] = dy[i] * -1;
   //   dy[i] = dy[i] * 0.3;
   //   }

    if(px[i] > 300){
      px[i] = 300;
      dx[i] = dx[i] * -1;
      dx[i] = dx[i] * 0.4;
    }

 if(px[i]>220 && px[i]<270 && py[i]>100 && py[i] < 150){
  px[i] = 100;
  py[i] = 290;
  dx[i] = 0;
  dy[i] = 0;
  score += 1;
 }

if(px[i]>270 && px[i]<280 && py[i]>90 && py[i] < 100 && dy[i]>0){
  py[i]=90;
  dy[i] = dy[i] * -1;
  dy[i] = dy[i] * 0.4;
}

if(px[i]>187 && px[i]<197 && py[i]>103 && py[i] < 183){
  px[i]=187;
  dx[i] = dx[i] * -1;
  dx[i] = dx[i] * 0.4;
}
if(px[i]>202 && px[i]<212 && py[i]>163 && py[i] < 208){
  px[i]=202;
  dx[i] = dx[i] * -1;
  dx[i] = dx[i] * 0.4;
}
if(px[i]>207 && px[i]<297 && py[i]>208 && py[i] < 218){
  py[i]=218;
  dy[i] = dy[i] * -1;
  dy[i] = dy[i] * 0.4;
}


if( dx[i]>-0.2 && dx[i]<0.2 && py[i] > 288 && px[i]!=100){
 stop[i] += 1;
 if(stop[i]>50){
  px[i] = 100;
  py[i] = 290;
  dx[i] = 0;
  dy[i] = 0;
  stop[i] = 0;
  } 
 }


 if(i%2 == 0){
    image(ritsu, px[i]-20, py[i]-20);
    }else{
    image(rasa, px[i]-20, py[i]-20);
    }
  }

 if(ak>20){
  

    ady = ady + g;
    apx = apx + adx;
    apy = apy + ady;

    if(apy > 283){
    apy = 283;
    ady = ady * -1;
    ady = ady * 0.4;
    adx = adx * 0.4;
    }
 
 //   if(apy < 20){
 //     apy = 20;
 //     ady = ady * -1;
 //     ady = ady * 0.3;
 //     }

    if(apx > 290){
      apx = 290;
      adx = adx * -1;
      adx = adx * 0.4;
    }

 if(apx>220 && apx<270 && apy>100 && apy < 150){
  apx = 100;
  apy = 283;
  adx = 0;
  ady = 0;
  score += 10;
  ak = 0;
  ht = true;
 }

if(apx>187 && apx<197 && apy>103 && apy < 183){
  apx=187;
  adx = adx * -1;
  adx = adx * 0.4;
}
if(apx>202 && apx<212 && apy>163 && apy < 208){
  apx=202;
  adx = adx * -1;
  adx = adx * 0.4;
}
if(apx>207 && apx<297 && apy>208 && apy < 218){
  apy=218;
  ady = ady * -1;
  ady = ady * 0.4;
}


if( adx>-0.2 && adx<0.2 && apy > 280 && apx!=100){
 astop += 1;
 if(astop>50){
  apx = 100;
  apy = 290;
  adx = 0;
  ady = 0;
  astop = 0;
  ak = 0;
  } 
 }
   image(akiko, apx-30, apy-30);

}
//ak

   if(ht){
    image(heart, 220, hpy);
    hpy -= 5;
    if(hpy < -30){
    ht = false;
    hpy = 110;
    }
   }


 line(0, 315, 520, 315);
 
 stroke(56, 172, 236);
 fill(127, 232, 23);
 rect(200, 110, 90, 30);
 rect(210, 140, 70, 30);
 rect(220, 170, 50, 30);
 fill(255, 255, 255);
 stroke(255, 255, 255);
 line(290, 113, 290, 315);


// fill(56, 172, 236);
 noFill();
 rect(10,320,300,20);

 time -= 0.6;
 if(time < 0 ){
  time = 0;
  
  if(score>29){
    image(yoshi, 100+((108-ysize)*0.5), 185+((108-ysize)*0.5), ysize, ysize);
    ysize = ysize + ysized;
    if(ysize < 70 || ysize > 108){
      ysized = ysized * -1;
    }

    fill(255,255,255);
    textSize(24);
    text("Well done!", 95,220);

    if(score>59){
    image(yoshi, 100+((108-ysize)*0.5), 15+((108-ysize)*0.5), ysize, ysize);
    image(yoshi, ((108-ysize)*0.5),100+((108-ysize)*0.5), ysize, ysize);
    image(yoshi, 200+((108-ysize)*0.5),100+((108-ysize)*0.5), ysize, ysize);
    }

    if(score>99){
    text("Over 100!?!? Are you nuts?", 15,260);
    }

  }

  textSize(124);
  fill(255,255,255);
  if(score<10){
    text(score, 120, 200);
  }else{
    text(score, 80, 200);
  }
  
  noFill();
  stroke(255,255,255);
  rect(113, 63, 80, 30, 10, 10,10,10);
  fill(255,255,255);
  textSize(20);
  text("Retry",129,83);

 }else{
  textSize(64);
  fill(255,255,255);
  if(score<10){
    text(score, 227, 180);
  }else{
    text(score, 210, 180);
  }
  fill(248, 114, 23);
  stroke(248, 114, 23);
  rect(13,323,time,14);

 }


//textSize(14);
//text(ysize, 17, 380);
//text(hpy, 17, 400);
//text(dy[0], 17, 420);

}

void mousePressed() {
  if(mouseY < 350){
    shot = true;
  }
}

void mouseReleased() {

 if(mouseY > 315 && time != 0 && shot){

 if(ak>20 && apx == 100 && apy == 283){
    adx = (100-mouseX) * 0.11;
    ady = -1 * (mouseY-290) * 0.11;
 }else{

  for( int i=0, go=-1; i < 24; i++){
    if (px[i]==100 && py[i]==290){
      go = i;
      i = 25;
    }
  }
  if(go !=-1){
  if(go%2 == 0){
    dx[go] = (100-mouseX)* 0.11;
    dy[go] = -1 * (mouseY-290)* 0.11;
  }else{
    dx[go] = (100-mouseX)* 0.13;
    dy[go] = -1 * (mouseY-290)* 0.12;
  }
  }
  ak += 1;
 }
 shot = false;
 }
 
 if(time==0 && mouseY < 300){
  go = 0;
  score = 0;
  time = 294;
  px = {100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100};
  py = {290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290,290};
  dx = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
  dy = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
 }


};
