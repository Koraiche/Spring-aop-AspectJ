package ma.emsi.centre.springaspectjaop.domain;


import lombok.AllArgsConstructor;
import lombok.Data;

@Data @AllArgsConstructor
public class Compte {
    private Long code;
    private double solde;
}
