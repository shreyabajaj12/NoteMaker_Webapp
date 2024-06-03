package servlets;

import com.entities.Note;
import com.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet("/SaveNoteServlet")
public class SaveNoteServlet extends HttpServlet {
    public SaveNoteServlet(){
        super();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String title = request.getParameter("title");
            String content=request.getParameter("content");
            Note note =new Note(new Date(),content,title);
            System.out.println(title);
            System.out.println(content);

            Session s=FactoryProvider.getFactory().openSession();
            Transaction tx=s.beginTransaction();
            s.save(note);
            tx.commit();
            s.close();
            response.setContentType("text/html");
            PrintWriter out=response.getWriter();
            out.println("<h1 style='text-align:center'>Note is added successfully</h1>");
            out.println("<h1 style=text-align:center><a href='all_notes.jsp'>View All </h1>");
        }
        catch(Exception e){
            e.printStackTrace();
        }

    }

}
