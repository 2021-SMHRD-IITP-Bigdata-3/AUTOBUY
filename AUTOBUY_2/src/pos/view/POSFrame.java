package pos.view;
import javax.swing.JFrame;

public class POSFrame extends JFrame {
	public POSFrame() {
		setTitle("AUTOBUY POS SYSTEM");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		setContentPane(new POSPanel());

		setSize(985,660);
		setVisible(true);
	}
}
