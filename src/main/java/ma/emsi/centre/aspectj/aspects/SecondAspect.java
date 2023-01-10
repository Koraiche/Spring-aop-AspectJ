package ma.emsi.centre.aspectj.aspects;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;

/*
* The class syntaxe
*
*/
@Aspect
public class SecondAspect {
    @Pointcut("execution(* aspects.*.main(..))")
    public void pc1(){

    }
    @Around("pc1()")
    public void aroundMain(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        System.out.println("Before Around");
        proceedingJoinPoint.proceed();
        System.out.println("After Around");
    }
    @Before("pc1()")
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
