# HouseholderAcoustics

## Description
Package R pour l’analyse acoustique via la transformation de Householder et la décomposition QR.  
L’utilisateur fournit une matrice A (système acoustique) et un vecteur x (signal).

## Fonctionnalités
- Calcul du vecteur et de la matrice de Householder
- Réflexion orthogonale du signal
- Décomposition QR
- Validation Ax = QRx
- Analyse fréquentielle FFT
- Visualisations automatiques

## Utilisation
```r
# Exemple de matrice et vecteur
> A <- matrix(c(3,1,2, 1,4,0, 2,0,5), 3,3)
> x <- c(1,0.5,-0.2)
> 
> # Appel de la fonction principale
> res <- Householder(A, x)
> print(res)

