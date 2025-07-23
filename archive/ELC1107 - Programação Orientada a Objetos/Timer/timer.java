import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class tasktwo {
	
	static Timer timer;
	static String chSeconds = "10";
	static int intSeconds;
	
	//NaN checker
	public static boolean isNumeric(String str) { 
		  try {  
		    Double.parseDouble(str);  
		    return true;
		  } catch(NumberFormatException e){  
		    return false;  
		  }  
		}

	public static void main(String[] args) {
		
		JFrame janela = new JFrame("Tetimer v1.0");
		
		//defaults
		int windowWidth = 300;
		int windowHeight = 300;
		int buttonWidth = 100;
		int buttonHeight = 40;
		
		//window
		janela.setBounds(300, 100, windowWidth, windowHeight);
		janela.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
		janela.setResizable(false);
		
		//output
		JLabel output = new JLabel("Digite o tempo em Segundos: ");
		output.setBounds(0, 10, (windowWidth), 100);
		output.setHorizontalAlignment(JLabel.CENTER);
		
		//input
		JTextField input = new JTextField(3);
		input.setHorizontalAlignment(JLabel.CENTER);
		input.setBounds(50, 120, (windowWidth-100), 50);
		
		//buttons
		JButton bStart = new JButton("Iniciar");
		bStart.setBounds(40, (windowHeight-buttonHeight-70), buttonWidth, buttonHeight);
		JButton bStop = new JButton("Parar");
		bStop.setBounds((windowWidth-buttonWidth-40), (windowHeight-buttonHeight-70), buttonWidth, buttonHeight);
		
		//builder
		Container caixa = janela.getContentPane();
		caixa.setLayout(null);
		caixa.add(output);
		caixa.add(input);
		caixa.add(bStop);
		caixa.add(bStart);
		
		//EVENT_START_BUTTON_CLICK
		bStart.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e){
				
				if(bStart.getText() == "Iniciar") {
					chSeconds = input.getText();
					if(isNumeric(chSeconds) == true) {
						intSeconds = Integer.parseInt(chSeconds);
						
						if(intSeconds > 0) {
							output.setText(intSeconds + "s");
							timer.start();
							bStart.setText("Pausar");
						} else if(intSeconds < 0) {
							output.setText("Alô? Benjamin Butle?");
						} else if(intSeconds == 0){
							timer.stop();
							output.setText("Terminou!");
							java.awt.Toolkit.getDefaultToolkit().beep();
							bStart.setText("Iniciar");
						}
					} else {
						output.setText("Tá de sacanagem, né?");
					}
				} else if (bStart.getText() == "Pausar"){
					timer.stop();
					bStart.setText("Continuar");
				} else {
					timer.start();
					bStart.setText("Pausar");
				}
			}
		});
		
		//EVENT_STOP_BUTTON_CLICK
		bStop.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e){
				bStart.setText("Iniciar");
				timer.stop();
				output.setText("Digite o tempo em Segundos: ");
				
			}
		});
		
		
		//timerAPP
		timer = new Timer(1000, new ActionListener() {
			public void actionPerformed(ActionEvent e) {
					intSeconds--;
					output.setText(intSeconds + "s");
					if(intSeconds == 0) {
						timer.stop();
						output.setText("Terminou!");
						java.awt.Toolkit.getDefaultToolkit().beep();
						bStart.setText("Iniciar");
					}
			}
		});
		
		
		janela.setVisible(true);
	}
	

}
