import java.awt.Color;
import java.awt.Frame;
import java.awt.Graphics;
import java.awt.Point;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;


public class ImplAP extends Frame{

	static final int dimension = 20;
	ArrayList<Point> pa ;
	ArrayList<Point> list ;
	Map<Point,List<Point>> allPoint = new HashMap<Point,List<Point>>();
	static int s[][] ;
	static int r[][] = new int[dimension][dimension];
	static int rold[][] = new int[dimension][dimension];
	static int a[][] = new int[dimension][dimension];
	static int aold[][] = new int[dimension][dimension];
	static int m[][] = new int[dimension][dimension]; 
	double lamp = 0.5;
	int WIDTH = 10;
	int HEIGHT = 10;
	
	public void initialization(){
		
		Point p ;
		pa = new ArrayList<Point>();
		p = new Point(50,200);
		pa.add(p);
		p = new Point(100,200);
		pa.add(p);
		p = new Point(150,200);
		pa.add(p);
		p = new Point(200,200);
		pa.add(p);
		p = new Point(250,200);
		pa.add(p);
		p = new Point(300,200);
		pa.add(p);
		p = new Point(350,200);
		pa.add(p);
		p = new Point(400,200);
		pa.add(p);
		p = new Point(67,220);
		pa.add(p);
		p = new Point(84,240);
		pa.add(p);
		
		p = new Point(117,260);
		pa.add(p);
		p = new Point(134,280);
		pa.add(p);
		p = new Point(167,300);
		pa.add(p);
		p = new Point(184,320);
		pa.add(p);
		p = new Point(267,320);
		pa.add(p);
		p = new Point(284,300);
		pa.add(p);
		p = new Point(317,280);
		pa.add(p);
		p = new Point(334,260);
		pa.add(p);
		p = new Point(367,240);
		pa.add(p);
		p = new Point(384,220);
		pa.add(p);

/*		Random rnd = new Random();
		pa = new ArrayList<Point>();
		for(int i=0;i<dimension;i++){
			int x = rnd.nextInt(300)+100;
			int y = rnd.nextInt(300)+100;
			Point p = new Point(x,y);
			System.out.println(p);
			pa.add(p);
		}
		System.out.println("链表长度："+pa.size());
*/
	}
	
	public void similarity(){
		
		s = new int[dimension][dimension];
		System.out.println("相似度数据:");
		for(int i=0;i<pa.size();i++){
			Point p = (Point)pa.get(i);
			int x1 = (int)p.getX();
			int y1 = (int)p.getY();
			System.out.print("第"+i+"个点："+x1+",");
			System.out.println(y1);
			for(int j=i+1;j<pa.size();j++){
				p = (Point)pa.get(j);
				int x2 = (int)p.getX();
				int y2 = (int)p.getY();
				System.out.print("第"+j+"个点："+x2+",");
				System.out.println(y2);
				s[i][j] = (int)-(Math.sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)));
				s[j][i] = s[i][j];
				System.out.println(i+","+j+":"+s[i][j]);
			}		
		}
		
		System.out.println();
		this.average();
		System.out.println("相似度矩阵:s[i][k]");
		for(int i=0; i<dimension;i++){
			for(int j=0; j<dimension; j++){
				System.out.print(s[i][j]+" ");
			}
			System.out.println();
		}
	}
	
	public void average(){
/*		for(int i=0;i<dimension;i++){
			s[i][i] = -65535;
		}
		System.out.println();
		System.out.println("preference赋值之前矩阵输出：");
*/
		int sum = 0;
		for(int i=0;i<dimension;i++){
			for(int j=0;j<dimension;j++){
//				System.out.print(s[i][j]+" ");
				sum += s[i][j];
			}
//			System.out.println();
		}
		
		sum = sum / (dimension*dimension);
//		System.out.println("均值："+sum);
		for(int i=0;i<dimension;i++){
			s[i][i] = sum;
		}
//		s[0][0] = 2000;
	}
	
	public void calRes(){
		
		for(int i=0;i<dimension;i++){	
			int max = -65535;
			for(int k=0;k<dimension;k++){			
				for(int j=0;j<dimension;j++){
					if(j != k){
						if(max < a[i][j]+ s[i][j])
						{
							max = a[i][j]+ s[i][j];
						}
					}
				}
//				System.out.println("最大值："+max);
				r[i][k] = s[i][k] - max;
				max = -65535;
			}
		}
		
//		System.out.println("r(i,k)矩阵输出：");
		for(int i=0; i<dimension;i++){
			for(int j=0; j<dimension; j++){
//				System.out.print(r[i][j]+" ");
				r[i][j] = (int)(r[i][j]*(1-lamp) + rold[i][j]*lamp);
				rold[i][j] = r[i][j];
			}
//			System.out.println();
		}
		
/*		System.out.println();
		System.out.println("r(i,k)阻尼矩阵输出：");
		for(int i=0; i<dimension;i++){
			for(int j=0; j<dimension; j++){
				
				System.out.print(r[i][j]+" ");
			}
			System.out.println();
		}
*/
	}
	
	public void calAvail(){
		for(int i=0;i<dimension;i++){
			int sum = 0;
			for(int k=0;k<dimension;k++){
				if(i == k){
					for(int j=0;j<dimension;j++){
						if(j != k){
							if(r[j][k]>0){
								sum += r[j][k];
							}
						}
					}
					a[k][k] = sum;
					sum = 0;
				}
				else{
					for(int j=0;j<dimension;j++){
						if(j != k && j!=i){
							if(r[j][k]>0){
								sum += r[j][k];
							}
						}
					}
					a[i][k] = r[k][k] + sum;
					if(a[i][k] >0)
						a[i][k] = 0;
					sum = 0;
				}
			}
		}
		
//		System.out.println("a(i,k)矩阵输出：");
		for(int i=0; i<dimension;i++){
			for(int j=0; j<dimension; j++){
//				System.out.print(a[i][j]+" ");
				a[i][j] = (int)(a[i][j]*(1-lamp) + aold[i][j]*lamp);
				aold[i][j] = a[i][j];
			}
//			System.out.println();
		}
		
/*		System.out.println();
		System.out.println("a(i,k)阻尼矩阵输出：");
		for(int i=0; i<dimension;i++){
			for(int j=0; j<dimension; j++){
				System.out.print(a[i][j]+" ");
			}
			System.out.println();
		}
*/
	}
	
	public void paint(Graphics g) {
		Point p1,p2;
		Iterator<Entry<Point, List<Point>>>  i = allPoint.entrySet().iterator();
		while(i.hasNext()){
			  Entry<Point, List<Point>> e = i.next();
			  p1 = e.getKey();
			  Color c = g.getColor();
			  g.setColor(Color.RED);
			  g.drawString((int)p1.getX()+","+(int)p1.getY(), (int)p1.getX()-WIDTH, (int)p1.getY()-HEIGHT);
			  g.fillOval((int)p1.getX()-WIDTH/2, (int)p1.getY()-HEIGHT/2, WIDTH, HEIGHT);
			  for(int j=0;j<e.getValue().size();j++){
				 p2 = e.getValue().get(j);
				 g.setColor(Color.BLUE);
				 g.drawString((int)p2.getX()+","+(int)p2.getY(), (int)p2.getX()-WIDTH, (int)p2.getY()-HEIGHT);
				 g.fillOval((int)p2.getX()-WIDTH/2, (int)p2.getY()-HEIGHT/2, WIDTH, HEIGHT);
				 g.drawLine((int)p1.getX(), (int)p1.getY(), (int)p2.getX(), (int)p2.getY());
			  }
			  g.setColor(c);
		}
	}

	public void launchFrame() {
		
		this.setLayout(null);
		this.setSize(450, 450);
		this.setLocation(0, 0);
		this.setResizable(false);
		this.addWindowListener(new WindowAdapter (){
			public void windowClosing(WindowEvent e){
				System.exit(0);
			}
		});
		this.setBackground(Color.WHITE);		
		this.setVisible(true);
//		new Thread(new PaintAP()).start();
		
		initialization();
		similarity();
		
		int iter = 1000;
		for(int i=0;i<iter;i++){
//			System.out.println();
//			System.out.println("第"+i+"次  r(i,k)矩阵输出");
			calRes();
//			System.out.println();
//			System.out.println("第"+i+"次  a(i,k)矩阵输出");
			calAvail();
		}
		
		for(int i=0;i<dimension;i++){
			for(int j=0;j<dimension;j++){
				m[i][j] = a[i][j] + r[i][j];
			}
		}
		
/*		System.out.println("和矩阵M：");
		for(int i=0;i<dimension;i++){
			for(int j=0;j<dimension;j++){
				System.out.print(m[i][j]+" ");
			}
			System.out.println();
		}
*/		

		for(int i=0;i<dimension;i++){
			int max = -65535;
			int loc = 0;
			for(int j=0;j<dimension;j++){
				if(max < m[i][j]){
					max = m[i][j];
					loc = j;
				}
			}
			System.out.println("样本点："+loc+" "+"普通点"+i);
			
			if(pa.get(loc) != pa.get(i)){
				if(allPoint.containsKey(pa.get(loc))){
					allPoint.get(pa.get(loc)).add(pa.get(i));
				}else{
					list = new ArrayList<Point>();
					list.add(pa.get(i));
					allPoint.put(pa.get(loc), list);
				}
			}else{
				if(!allPoint.containsKey(pa.get(loc))){
					list = new ArrayList<Point>();
					allPoint.put(pa.get(loc), list);
				}
			}
			
		}
		
		System.out.println("Map个数:"+allPoint.size());
		Iterator<Entry<Point, List<Point>>>  i = allPoint.entrySet().iterator();
		while(i.hasNext()){
			  Entry<Point, List<Point>> e = i.next();
			  System.out.println("样本点："+e.getKey());
			  for(int j=0;j<e.getValue().size();j++){
				  System.out.println("普通点："+e.getValue().get(j));
			  }
			  System.out.println();
		}
		
		this.repaint();
	}
	
	private class PaintAP implements Runnable{

		public void run() {
			while(true){
				repaint();
				try {
					Thread.sleep(50);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
			
		}
		
	}
	
	public static void main(String[] args) {
		ImplAP impl = new ImplAP();
		impl.launchFrame();
	}
}
