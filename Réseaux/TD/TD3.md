# Couche Liaison de Données

## Création d'un protocole ARQ

1. Peut envoyer et assurer la réception de la trame mais ne peut pas gérer la perte de trame.
2. Une fois le temporisateur dépassé, il détecte la perte de la trame et la renvoie.
3. Si le récepteur reçoit la trame mai l'ACK est perdu ou le recpeteur émet l'ACK avec délai supérieur au temporisateur.
4. .
5. Les ACK ne détaillebt pas quel trame elle confirment. On peut numéroter les ACK. La numérotation des trames et ACK prennent de la place. On peut ajouter un bit qui précise s'il a reçu la trame 1 ou 0.
   
## Transparence pour la délimitation de trames

1. mettre un 0 avant le sixième 1 pour casser le signal similaire au fanion.
2. idem à l'envers
3. `10111110111110101`
4. 0111 `| 01111110 11011111 01111110 | `0011111111` | 01111110 110111111 01111110 |`

## La Trame Ethernet

1. 72 octets en faisant la somme de toute la trame présentée.
2. 46 octets pour la partie *Information*
3. Il sert à synchroniser.
4. + Émetteur : `12000028e903`
   + Récepteur: `10003f066a5c`

## Les contrôles d'erreur

### Distance de Hamming

Distance mini = 2

### Contrôle de Parité

### Contrôle de parité croisée


1. 
   | Lettre  | Code Ascii | **VRC** |
   | :-----: | :--------: | :-----: |
   |   *H*   | `1001000`  |   `0`   |
   |   *E*   | `1000101`  |   `1`   |
   |   *L*   | `1001100`  |   `1`   |
   |   *L*   | `1001100`  |   `1`   |
   |   *O*   | `1001111`  |   `1`   |
   | **LRC** | `1000010`  |   `0`   |

2. Dans le cas d'une inversion de bit ou du changement d'un nombre pair de bits alors ce n'est pas efficace. On ne détecte que 50% des erreurs.