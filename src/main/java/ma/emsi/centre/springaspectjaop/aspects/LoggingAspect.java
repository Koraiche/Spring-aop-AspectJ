package ma.emsi.centre.springaspectjaop.aspects;


import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {
    @Pointcut("execution(* metier.impl.*.*(..))")
    public void pc1(){

    }
    @Before("pc1()")
    public void beforePC1(){
        System.out.println("before pc1");
    }
}
