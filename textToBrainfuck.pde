import java.awt.Toolkit;
import java.awt.datatransfer.StringSelection;
import java.awt.datatransfer.Clipboard;

String str_input = "";
String str_output = "";
String str_display_output = "";
int textSizeInt;
StringSelection selection;

void setup()
{
  size(600, 800);
  selection = new StringSelection("");
  
  background(255);
  fill(0);
  textSize(16);
  textSizeInt = 16;
  textAlign(CENTER, CENTER); //<>//
}

void draw()
{
  background(255);
  textSize(16);
  text("Type some text, \nand the Brainfuck code will be copied to clipboard automatically. \nRight-click to reset", width/2, 30);
  text("INPUT : " + str_input, width/2, 90);
  while (textWidth(str_display_output) >= width && textSizeInt >= 2)
  {
    textSize(textSizeInt-1);
    textSizeInt--;
  }
  textSize(textSizeInt);
  text("OUTPUT : " + str_display_output, width/2, 110);
}
 //<>//
void keyTyped()
{
  str_output += convert(key);
  str_display_output = str_output;
  println(str_output);
  selection = new StringSelection(str_output);
  Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
  clipboard.setContents(selection, selection);
  str_input += str(key);
}

void mouseClicked()
{
  if (mouseButton == RIGHT)
  {
    str_output = "";
    str_display_output = "";
    str_input = "";
    textSizeInt = 16;
  }
}

String convert(int keyInt)
{
  String c = "";
  
  for (int i = 0; i < int(keyInt); i++)
  {
    c += "+";
  }
  c += ".";
  for (int j = 0; j < int(keyInt); j++)
  {
    c += "-";
  }
  
  return c;
}
