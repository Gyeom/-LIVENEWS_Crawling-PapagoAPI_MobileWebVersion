package NMT;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NMTTestServlet
 */
@WebServlet("/NMTTestServlet")
public class NMTTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NMTTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 System.out.println("NMTTestServlet doPost �޼ҵ尡 ����Ǿ����ϴ�.");
		    request.setCharacterEncoding("UTF-8");
		    response.setContentType("text/html;charset=utf-8");

		    //������ text ���� �޾� �ɴϴ� 
		    String original_str = (String)request.getParameter("original_str");
		    
		    //����� ������ ���Ѱ� 
		    PrintWriter out = response.getWriter();
		    out.print((String)nmtReturnRseult(original_str));
	}
	// nmtReturnResult�� �Լ��� ���ؼ� �ѱ� - > ����� ����
	public String nmtReturnRseult(String original_str){
	    
	    //���ø����̼� Ŭ���̾�Ʈ ���̵�";
	    String clientId = "6jxVIB0bYIj1h1NJleqK";
	    //���ø����̼� Ŭ���̾�Ʈ ��ũ����";
	    String clientSecret = "VAF76f9X5C";
	    
	    String resultString ="";
	    try {
	        //original_str ���� �츮�� ��ȯ�� �� 
	        String text = URLEncoder.encode(original_str, "UTF-8");
	        
	        String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
	        URL url = new URL(apiURL);
	        HttpURLConnection con = (HttpURLConnection)url.openConnection();
	        con.setRequestMethod("POST");
	        con.setRequestProperty("X-Naver-Client-Id", clientId);
	        con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	        // post request
	        String postParams = "source=en&target=ko&text=" + text;
	        con.setDoOutput(true);
	        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
	        wr.writeBytes(postParams);
	        wr.flush();
	        wr.close();
	        int responseCode = con.getResponseCode();
	        BufferedReader br;
	        if(responseCode==200) { // ���� ȣ��
	            br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
	        } else {  // ���� �߻�
	            br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
	        }
	        String inputLine;
	        StringBuffer response = new StringBuffer();
	        while ((inputLine = br.readLine()) != null) {
	            response.append(inputLine);
	        }
	        br.close();
	        System.out.println(response.toString());
	        
	        resultString = response.toString();
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	    
	    return resultString;
	}
}
