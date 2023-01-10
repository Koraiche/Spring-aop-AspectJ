package ma.emsi.centre.springaspectjaop.aspects;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

/*
 * The class syntaxe
 *
 */
@Aspect @Component
public class MyAspect {
    @Pointcut("execution(* *.run(..))")
    public void pc1(){

    }
    /*@Around("pc1()")
    public void aroundMain(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        System.out.println("Before Around");
        proceedingJoinPoint.proceed();
        System.out.println("After Around");
    }*/
    @Before(value="pc1()")
    public void beforeMain(){
        System.out.println("beforeMain");
    }
    @After("pc1()")
    public void afterMain(){
        System.out.println("afterMain");
    }
    @AfterReturning("pc1()")
    public void afterMainReturning(){
        System.out.println("afterMainReturning");
    }
    @AfterThrowing("pc1()")
    public void afterMainThrowing(){
        System.out.println("afterMainThrowing");
    }
}
