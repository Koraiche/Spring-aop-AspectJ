package ma.emsi.centre.springaspectjaop.aspects;


import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {
    @Pointcut("execution(* metier.**.*(..)")
    public void pc1(){

    }
}
