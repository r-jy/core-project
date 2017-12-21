IntDict woolfcounts;
IntDict kincaidcounts;
String[] keys;
ArrayList<String> kincaidwords;
ArrayList<String> woolfwords;
ArrayList<String> removek;
ArrayList<String> removew;
PFont yumin;
///////////////////////////
void setup() {
 frameRate(3.0);
  size(500,500);
  background(0);
  textSize(50);
  yumin = loadFont("YuMin-Extrabold-30.vlw");
  textFont(yumin);
  //create woolf dictioanry
  woolfcounts = new IntDict(); //lowercase dictionary with words and wordcount
  String[] wlines = loadStrings("aroomofonesown.txt");
  String wallwords = join(wlines,'\n');
  String delimiters = " —,.?!;:\n-()[]*\"";
  String[] wtokens = splitTokens(wallwords,delimiters);
  for (int i = 0; i < wtokens.length;i++){
    String wword = wtokens[i].toLowerCase();
    if (woolfcounts.hasKey(wword)) {
      woolfcounts.increment(wword);
    } else {
      woolfcounts.set(wword,1);
    }
  }
  woolfcounts.sortValues();
  // create kincaid dictionary
  kincaidcounts = new IntDict(); //lowercase dictionary with words and wordcount
  String[] klines = loadStrings("asmallplace.txt");
  String kallwords = join(klines,'\n');
  String[] ktokens = splitTokens(kallwords,delimiters);
  for (int i = 0; i < ktokens.length;i++){
    String kword = ktokens[i].toLowerCase();
    if (kincaidcounts.hasKey(kword)) {
      kincaidcounts.increment(kword);
    } else {
     kincaidcounts.set(kword,1);}
    }
  kincaidcounts.sortValues();
// draw woolf image
 String [] woolfkeys = woolfcounts.keyArray();
 woolfwords = new ArrayList<String>();
 removew = new ArrayList<String>();
    for (String k: woolfkeys) {
     if(k.length()>1){
       if (k.charAt(k.length()-2)=='\'' && k.charAt(k.length()-1)=='s'){
        k = k.substring(0,k.length()-2);
      }
     }
     if(k.length()>1){
       if (k.charAt(k.length()-2)=='s' && k.charAt(k.length()-1)=='\''){
        k = k.substring(0,k.length()-2);
      }
     }
     if(k.length()>1){
       if (k.charAt(k.length()-1)=='\''){
        k = k.substring(0,k.length()-1);
      }
     }
     if(k.length()>=1){
      if (k.charAt(0)=='\''){
        k = k.substring(1);}
     }
     woolfwords.add(k);
     if (k.length()<=2){
       woolfwords.remove(k);
     }
      }
 print(woolfwords);
// draw kincaid image
   String [] kincaidkeys = kincaidcounts.keyArray();
   kincaidwords = new ArrayList<String>();
   removek = new ArrayList<String>();
    for (String k: kincaidkeys) {
     if(k.length()>1){
       if (k.charAt(k.length()-2)=='\'' && k.charAt(k.length()-1)=='s'){
        k = k.substring(0,k.length()-2);
      }
     }
     if(k.length()>1){
       if (k.charAt(k.length()-2)=='s' && k.charAt(k.length()-1)=='\''){
        k = k.substring(0,k.length()-2);
      }
     }
     if(k.length()>1){
       if (k.charAt(k.length()-1)=='\''){
        k = k.substring(0,k.length()-1);
      }
     }
     if(k.length()>=1){
      if (k.charAt(0)=='\''){
        k = k.substring(1);}
     }
     kincaidwords.add(k);
     if (k.length()<=2){
       kincaidwords.remove(k);
     }
    }
for (String k: woolfwords){
  if (kincaidwords.contains(k)){
    removew.add(k);
  }
}
print(removew);
 for (String k: kincaidwords){
   if (woolfwords.contains(k)){
     removek.add(k);
   }
 }
woolfwords.removeAll(removew);
kincaidwords.removeAll(removek);
}


void draw(){
  background(180, 131, 138);
  fill(204, 102, 0);
  noStroke();
  rect(0, height/2, width, height/2);
  stroke(255);
  strokeWeight(8);
  line(0, height/2, width, height/2);
  fill(255);
  int rand = (int)random(kincaidwords.size());
  yumin = loadFont("YuMin-Extrabold-30.vlw");
  textFont(yumin);
  textAlign(CENTER,BOTTOM);
  text(kincaidwords.get(rand),width/2,3*height/4);
  int rand1 = (int)random(woolfwords.size());
  textAlign(CENTER,TOP);
  text(woolfwords.get(rand1),width/2,height/4);
}

 void mouseClicked() {
  if (mouseY < height/2){ 
    fill(255);
    textAlign(CENTER,TOP);
    textSize(20);
    text("woolf",width/2,height/50);
  }
  if (mouseY > height/2) {
    textAlign(CENTER,TOP);
     textSize(20);
    text("kincaid",width/2,height/2 + height/30);
  }
    
    }