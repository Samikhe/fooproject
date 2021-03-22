import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;


public class EmployeeSystemTest {


    Employee e1 = new Employee("Sami Khelifi", 32, 33000);
    ;
    EmployeeSystem es = new EmployeeSystem();

    @Test
    void testEmployeeSystem(){
        EmployeeSystem es = new EmployeeSystem();

    }

    @Test
    void testAddEmployee(){
        es.addEmployee(e1);
        assertEquals(1, es.employeeList.size());
    }

    @Test
    void testGetEmployee(){
        es.addEmployee(e1);
        assertEquals(e1, es.getEmployee(0));
    }

    @Test
    void testDeleteEmployee(){
        es.addEmployee(e1);
        assertEquals(1, es.employeeList.size());
        es.deleteEmployee(0);
        assertEquals(0, es.employeeList.size());

    }
    //VG Delen
    @Test
    void testRaiseSalary(){
        Employee e1 = new Employee("Sami Khelifi", 32,33000);
        es.addEmployee(e1);
        assertEquals(1, es.employeeList.size());
        es.raiseSalary(0, 50);
        assertEquals(33000*1.5, e1.getSalary());
    }

}
