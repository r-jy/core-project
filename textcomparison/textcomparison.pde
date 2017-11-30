IntDict woolfcounts;
IntDict kincaidcounts;
String[] keys;
StringList kincaidwords;
StringList woolfwords;
PFont butler;
///////////////////////////
void setup() {
 frameRate(3.5);
  size(500,500);
  background(0);
  textSize(50);
  butler = loadFont("YuMin-Extrabold-30.vlw");
  textFont(butler);
  //create woolf dictioanry
  woolfcounts = new IntDict(); //lowercase dictionary with words and wordcount
  String[] wlines = loadStrings("aroomofonesown.txt");
  String wallwords = join(wlines,'\n');
  String delimiters = " —,.?!;:\n-()[]*\"";
  String[] wtokens = splitTokens(wallwords,delimiters);
  //printArray(tokens);
  for (int i = 0; i < wtokens.length;i++){
    String wword = wtokens[i].toLowerCase();
    if (woolfcounts.hasKey(wword)) {
      woolfcounts.increment(wword);
    } else {
      woolfcounts.set(wword,1);
    }
  }
  woolfcounts.sortValues();
  println(woolfcounts);
  // create kincaid dictionary
  kincaidcounts = new IntDict(); //lowercase dictionary with words and wordcount
  String[] klines = loadStrings("asmallplace.txt");
  String kallwords = join(klines,'\n');
  String[] ktokens = splitTokens(kallwords,delimiters);
  //printArray(tokens);
  for (int i = 0; i < ktokens.length;i++){
    String kword = ktokens[i].toLowerCase();
    if (kincaidcounts.hasKey(kword)) {
      kincaidcounts.increment(kword);
    } else {
     kincaidcounts.set(kword,1);}
    }
  kincaidcounts.sortValues();
  println(kincaidcounts);
// draw woolf image
 String [] woolfkeys = woolfcounts.keyArray();
 woolfwords = new StringList();
    for (String k: woolfkeys) {
      int wcount = woolfcounts.get(k);
      woolfcounts.set(k,wcount);
      if (!kincaidcounts.hasKey(k)){
        woolfwords.append(k);
      }
      }
// draw kincaid image
   String [] kincaidkeys = kincaidcounts.keyArray();
   kincaidwords = new StringList();
    for (String k: kincaidkeys) {
      int kcount = kincaidcounts.get(k);
      kincaidcounts.set(k,kcount);
      if (!woolfcounts.hasKey(k)){
        kincaidwords.append(k);
      }
   }
}
void draw(){
  background(0);
  fill(204, 102, 0);
  noStroke();
  rect(0, height/2, width, height/2);
  stroke(255);
  strokeWeight(8);
  line(0, height/2, width, height/2);
  fill(255);
  int rand = (int)random(kincaidwords.size());
  textAlign(CENTER,BOTTOM);
  text(kincaidwords.get(rand),width/2,3*height/4);
  //text(kincaidwords.get(rand),CENTER,3*height/4);
  int rand1 = (int)random(woolfwords.size());
  textAlign(CENTER,TOP);
  text(woolfwords.get(rand1),width/2,height/4);
}

 void mouseClicked() {
  if (mouseY < height/2){ 
    fill(255);
    textAlign(LEFT,TOP);
    text("woolf",width/20,height/20);
  }
  if (mouseY > height/2) {
    textAlign(LEFT,BOTTOM);
    text("kincaid",width/20,19*height/20);
  }
    
    }