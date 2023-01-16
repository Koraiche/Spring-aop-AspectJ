package ma.emsi.centre.springaspectjaop.aspects;


import ma.emsi.centre.springaspectjaop.annotations.SecuredByAspect;
import ma.emsi.centre.springaspectjaop.service.SecurityContext;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;


@Aspect
@Component
public class AuthorizationAspect {

    Logger log = LoggerFactory.getLogger(this.getClass());

    @Pointcut("@annotation(securedByAspect)")
    public void securedAnnotated(SecuredByAspect securedByAspect){

    }

    @Around(value = "execution(* *(..)) && securedAnnotated(securedByAspect)", argNames = "proceedingJoinPoint, securedByAspect")
    public Object secureProcess(ProceedingJoinPoint proceedingJoinPoint, SecuredByAspect securedByAspect) throws Throwable {
        String[] roles = securedByAspect.roles();
        boolean authorized = false;
        for(String r: roles){
            if(SecurityContext.hasRole(r)){
                authorized=true;
                break;
            }
        }
        if(authorized==true){
            Object obj = proceedingJoinPoint.proceed();
            return obj;
        }
        throw new RuntimeException("Unauthorized => 403 !");
    }
}
