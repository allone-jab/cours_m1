
class Operation {
    private Integer a;
    private Integer b;
    private String op;
    
    public Operation(String op, Integer a, Integer b){
        this.op = op;
        this.a = a;
        this.b = b;
    }

    public int execute() {
        switch (this.op) {
            case "+":
                return (this.a + this.b);
            case "-":
                return (this.a - this.b);
            case "*":
                return (this.a * this.b);
            case "/":
                return (this.a / this.b);
            default:
                return 0;
        }
    }

    public String toString() {
        return (this.a).toString()+" "+this.op+" "+(this.b).toString();
    }
}