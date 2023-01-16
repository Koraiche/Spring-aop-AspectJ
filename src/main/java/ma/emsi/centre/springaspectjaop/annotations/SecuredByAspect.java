package ma.emsi.centre.springaspectjaop.annotations;


import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME) // interpreté au moment de l'execution
@Target(ElementType.METHOD) //dédiée au classes
public @interface SecuredByAspect {
  String[] roles();
}
