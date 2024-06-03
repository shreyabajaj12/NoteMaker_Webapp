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
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    public  DeleteServlet(){
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
//            to delete the particular card
            int noteId=Integer.parseInt(request.getParameter("note_id").trim());
            Session s= FactoryProvider.getFactory().openSession();
            Transaction tx=s.beginTransaction();
            Note note=s.get(Note.class, noteId);
            s.delete(note);
            tx.commit();
            s.close();
            response.sendRedirect("all_notes.jsp");
        }
        catch(Exception e){

        }
    }
}
