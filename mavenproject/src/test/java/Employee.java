public class Employee {
    public String name;
    public int age;
    public static int idCounter = 0;
    public int id;
    public double salary;

    public Employee(String name, int age, int salary) {
        idCounter++;
        this.name = name;
        this.age = age;
        this.salary = salary;
        this.id = idCounter;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }
    //VG Delen
    public void raiseSalary(double percent) {
        if(percent > 0 && percent < 101) {
            this.salary = this.salary * (percent / 100 + 1.0);
        }
    }
}
