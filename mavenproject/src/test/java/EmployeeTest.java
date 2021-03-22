import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class EmployeeTest {

    Employee e1 = new Employee("Sami Khelifi", 32, 33000);
    Employee e2 = new Employee("Johan Andersson", 50, 50000);


    @Test
    void testEmployee(){
        assertEquals("Sami Khelifi", e1.name);
        assertEquals(32, e1.age);
        assertEquals(33000, e1.salary);
        assertNotNull(e1.id);

    }

    @Test
    void testEmployeeName(){

        e1.getName();
        assertEquals("Sami Khelifi", e1.getName());

        e1.setName("Johan Andersson");
        assertEquals("Johan Andersson", e1.getName());
    }
    @Test
    void testEmployeeAge(){
        e1.getAge();
        assertEquals(32, e1.getAge());

        e1.setAge(32);
        assertEquals(32, e1.getAge());
    }

    @Test
    void testEmployeeSalary(){
        e1.getSalary();
        assertEquals(33000, e1.getSalary());

        e1.setSalary(29000);
        assertEquals(29000, e1.getSalary());
    }

    @Test
    void testEmployeeId(){

        e1.getId();
        assertNotNull( e1.getId());

        assertTrue(e1.getId() != e2.getId());

        e1.setId(10);
        assertEquals(10, e1.getId());

    }
    //VG delen
    @Test
    void TestRaiseSalary(){
        assertEquals(33000, e1.getSalary());
        e1.raiseSalary(100);
        assertEquals(33000*2, e1.getSalary());
    }
}
