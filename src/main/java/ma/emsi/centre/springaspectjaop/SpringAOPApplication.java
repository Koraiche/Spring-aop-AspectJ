package ma.emsi.centre.springaspectjaop;

import lombok.extern.slf4j.Slf4j;
import ma.emsi.centre.springaspectjaop.service.IMetier;
import ma.emsi.centre.springaspectjaop.service.SecurityContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.Async;


@SpringBootApplication @Slf4j
public class SpringAOPApplication implements CommandLineRunner {

	@Autowired
	private IMetier metier;

	public static void main(String[] args) {
		SpringApplication.run(SpringAOPApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		SecurityContext.authenticate("root", "root", new String[]{"USER"});
		this.metier.process();
		double cpt = this.metier.compute();
		System.out.println(cpt);


	}
}
