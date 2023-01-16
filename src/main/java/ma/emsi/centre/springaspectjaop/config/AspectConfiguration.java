package ma.emsi.centre.springaspectjaop.config;


import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@Configuration
@EnableAspectJAutoProxy(proxyTargetClass = true)
@ComponentScan("ma.emsi.centre.springaspectjaop")
public class AspectConfiguration {
}
