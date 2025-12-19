#' Householder Acoustic Analysis
#'
#' Calcule la matrice de Householder, la décomposition QR, et analyse un signal acoustique.
#'
#' @param A Matrice carrée représentant le système acoustique
#' @param x Vecteur représentant le signal
#' @return Une liste contenant :
#' Q : matrice orthogonale,
#' R : matrice triangulaire supérieure,
#' H : matrice de Householder,
#' Ax : produit original,
#' QRx : produit reconstruite via QR
#' @export
Householder <- function(A, x) {

  # Vérification dimensions
  if(!is.matrix(A)) stop("A doit être une matrice")
  if(!is.numeric(x)) stop("x doit être un vecteur numérique")
  if(nrow(A) != length(x)) stop("Longueur du vecteur x doit correspondre au nombre de lignes de A")

  # ---- Calcul du vecteur de Householder ----
  v <- x
  v[1] <- v[1] + sign(v[1])*sqrt(sum(x^2))
  v <- v / sqrt(sum(v^2))  # vecteur unitaire

  # ---- Matrice de Householder ----
  H <- diag(length(x)) - 2 * (v %*% t(v))

  # ---- Décomposition QR ----
  Q <- H
  R <- Q %*% A

  # ---- Calcul Ax et QRx ----
  Ax <- A %*% x
  QRx <- Q %*% R %*% x

  # ---- Visualisation ----
  par(mfrow=c(2,2))

  # Signal original
  plot(x, type="o", col="blue", main="Signal original x")

  # Produit Ax
  plot(Ax, type="o", col="red", main="Produit Ax")

  # Produit QRx
  plot(QRx, type="o", col="green", main="Produit QRx")

  # Spectre (FFT) du signal
  fft_x <- abs(fft(x))
  plot(fft_x, type="h", col="purple", main="Spectre du signal (FFT)")

  par(mfrow=c(1,1)) # revenir à 1 plot

  # ---- Retourner la liste des résultats ----
  return(list(
    Q = Q,
    R = R,
    H = H,
    Ax = Ax,
    QRx = QRx
  ))
}
