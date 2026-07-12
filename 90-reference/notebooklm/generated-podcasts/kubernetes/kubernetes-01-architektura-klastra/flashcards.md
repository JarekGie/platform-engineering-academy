# Kubernetes Fiszki

## Card 1

**Q:** Z jakich dwóch głównych części składa się klaster Kubernetes?

**A:** Z warstwy sterowania (control plane) oraz zestawu węzłów roboczych (nodes).

---

## Card 2

**Q:** Jaka jest minimalna liczba węzłów roboczych wymagana do uruchomienia Podów w klastrze?

**A:** Przynajmniej jeden węzeł roboczy.

---

## Card 3

**Q:** Który element klastra Kubernetes odpowiada za zarządzanie węzłami roboczymi i Podami?

**A:** Warstwa sterowania (control plane).

---

## Card 4

**Q:** Jak nazywa się front-end warstwy sterowania, który udostępnia API klastra?

**A:** kube-apiserver

---

## Card 5

**Q:** W jaki sposób komponent kube-apiserver realizuje skalowanie?

**A:** Poprzez skalowanie horyzontalne, czyli wdrażanie większej liczby instancji.

---

## Card 6

**Q:** Co pełni rolę głównego magazynu danych dla wszystkich informacji o klastrze Kubernetes?

**A:** etcd

---

## Card 7

**Q:** Jakiego typu bazą danych jest etcd?

**A:** Spójną i wysoko dostępną bazą typu klucz-wartość (key-value store).

---

## Card 8

**Q:** Który komponent warstwy sterowania wybiera węzeł dla nowo utworzonych Podów?

**A:** kube-scheduler

---

## Card 9

**Q:** Wymień dwa czynniki, które kube-scheduler bierze pod uwagę przy podejmowaniu decyzji o lokalizacji Poda.

**A:** Wymagania zasobowe oraz ograniczenia polityk/sprzętowe (np. taints, affinity).

---

## Card 10

**Q:** Jak nazywa się komponent warstwy sterowania uruchamiający procesy kontrolne?

**A:** kube-controller-manager

---

## Card 11

**Q:** Za co odpowiada Node controller wewnątrz kube-controller-manager?

**A:** Za zauważanie i reagowanie w sytuacjach, gdy węzły przestają działać.

---

## Card 12

**Q:** Który kontroler odpowiada za tworzenie Podów do wykonania jednorazowych zadań?

**A:** Job controller

---

## Card 13

**Q:** Jaka jest rola EndpointSlice controller?

**A:** Wypełnianie obiektów EndpointSlice w celu połączenia Usług (Services) z Podami.

---

## Card 14

**Q:** Do czego służy cloud-controller-manager w architekturze klastra?

**A:** Do łączenia klastra z API dostawcy chmurowego i obsługi logiki specyficznej dla chmury.

---

## Card 15

**Q:** Czy klaster uruchomiony lokalnie na komputerze PC zazwyczaj posiada cloud-controller-manager?

**A:** Nie, komponent ten jest specyficzny dla środowisk chmurowych.

---

## Card 16

**Q:** Który kontroler chmurowy odpowiada za tworzenie systemów równoważenia obciążenia (load balancers)?

**A:** Service controller

---

## Card 17

**Q:** Jak nazywa się agent działający na każdym węźle, który dba o uruchamianie kontenerów w Podach?

**A:** kubelet

---

## Card 18

**Q:** Na podstawie jakiego dokumentu kubelet upewnia się, że kontenery są zdrowe i działają?

**A:** PodSpec

---

## Card 19

**Q:** Czy kubelet zarządza kontenerami, które nie zostały utworzone przez Kubernetes?

**A:** Nie, kubelet nadzoruje wyłącznie kontenery zdefiniowane w ramach systemu Kubernetes.

---

## Card 20

**Q:** Który komponent węzła odpowiada za utrzymywanie reguł sieciowych i obsługę komunikacji do Podów?

**A:** kube-proxy

---

## Card 21

**Q:** W jakiej sytuacji uruchomienie kube-proxy na węźle nie jest wymagane?

**A:** Gdy używany plugin sieciowy dostarcza własną implementację przekierowania ruchu.

---

## Card 22

**Q:** Czym jest Container runtime w kontekście klastra Kubernetes?

**A:** Oprogramowaniem odpowiedzialnym za wykonywanie i zarządzanie cyklem życia kontenerów.

---

## Card 23

**Q:** Podaj dwa przykłady wspieranych środowisk uruchomieniowych kontenerów.

**A:** containerd oraz CRI-O.

---

## Card 24

**Q:** Co oznacza skrót CRI w kontekście środowisk uruchomieniowych?

**A:** Container Runtime Interface.

---

## Card 25

**Q:** W jakiej przestrzeni nazw (namespace) zazwyczaj znajdują się zasoby dla dodatków (Addons)?

**A:** kube-system

---

## Card 26

**Q:** Który dodatek jest niemal obowiązkowy dla każdego klastra ze względu na obsługę rekordów nazw usług?

**A:** Cluster DNS

---

## Card 27

**Q:** Do czego służy Dashboard w Kubernetes?

**A:** Jest to webowy interfejs użytkownika do zarządzania klastrem i aplikacjami.

---

## Card 28

**Q:** Jaka jest rola mechanizmu Cluster-level Logging?

**A:** Zapisywanie logów kontenerów do centralnego magazynu z interfejsem wyszukiwania.

---

## Card 29

**Q:** Za co odpowiadają Network plugins w klastrze?

**A:** Za przydzielanie adresów IP Podom oraz umożliwienie im komunikacji wewnątrz klastra.

---

## Card 30

**Q:** Czym są statyczne Pody (Static Pods) w kontekście warstwy sterowania?

**A:** Komponentami warstwy sterowania zarządzanymi bezpośrednio przez kubelet na konkretnych węzłach.

---

## Card 31

**Q:** Co to jest Managed Kubernetes service?

**A:** Usługa, w której dostawca chmurowy zarządza warstwą sterowania klastra za użytkownika.

---

## Card 32

**Q:** W jakich typach klastrów komponenty warstwy sterowania i aplikacje użytkownika mogą działać na tych samych węzłach?

**A:** W mniejszych klastrach lub środowiskach deweloperskich.

---

## Card 33

**Q:** Jak nazywa się podstawowa jednostka w klastrze, reprezentująca instancję aplikacji?

**A:** Pod

---

## Card 34

**Q:** Jakie zasoby są współdzielone przez kontenery wewnątrz jednego Poda?

**A:** Adres IP oraz woluminy (pamięć dyskowa).

---

## Card 35

**Q:** Jak nazywa się oficjalne narzędzie wiersza poleceń do zarządzania klastrami Kubernetes?

**A:** kubectl

---

## Card 36

**Q:** Z jakim komponentem klastra komunikuje się kubectl podczas wykonywania poleceń?

**A:** Z kube-apiserver.

---

## Card 37

**Q:** Węzły klastra mogą być maszynami wirtualnymi lub ____.

**A:** maszynami fizycznymi (tzw. bare metal).

---

## Card 38

**Q:** Jaką funkcję pełni Route controller w cloud-controller-manager?

**A:** Konfiguruje trasy (routes) w bazowej infrastrukturze chmurowej.

---

## Card 39

**Q:** Warstwa sterowania podejmuje decyzje na podstawie zdarzeń, np. o uruchomieniu nowego Poda, gdy pole _____ w Deployment nie jest spełnione.

**A:** replicas

---

## Card 40

**Q:** Co jest logicznie oddzielnym procesem, ale dla uproszczenia działa w jednym binarnym procesie kube-controller-manager?

**A:** Każdy poszczególny kontroler (np. Node controller, Job controller).

---

## Card 41

**Q:** Który komponent węzła zapewnia implementację koncepcji Usługi (Service) w sieci klastra?

**A:** kube-proxy

---

## Card 42

**Q:** Jak nazywa się mechanizm rozszerzania API o własne typy obiektów?

**A:** CustomResourceDefinitions (CRD).

---

## Card 43

**Q:** Który dodatek rejestruje metryki czasowe (time-series) o kontenerach w centralnej bazie danych?

**A:** Container Resource Monitoring

---

## Card 44

**Q:** Jak Kubernetes reaguje na fakt, że węzeł roboczy przestał działać?

**A:** Control Plane (Node controller) wykrywa awarię i może przeplanować Pody na inne węzły.

---

## Card 45

**Q:** Zasada 'self-hosting' w architekturze klastra polega na uruchamianiu warstwy sterowania jako _____.

**A:** Pody wewnątrz samego zarządzanego klastra.

---

## Card 46

**Q:** Jaką nazwę nosi agent CNI odpowiedzialny za komunikację między Podami?

**A:** Network plugin

---

## Card 47

**Q:** Gdzie fizycznie zazwyczaj uruchamiane są komponenty warstwy sterowania w dużych środowiskach produkcyjnych?

**A:** Na wielu dedykowanych maszynach w celu zapewnienia wysokiej dostępności.

---

## Card 48

**Q:** Co oznacza termin 'Data locality' w procesie harmonogramowania Podów?

**A:** Umieszczanie Poda blisko danych, których potrzebuje do pracy.

---

## Card 49

**Q:** Jak nazywa się proces, w którym kube-controller-manager dąży do wyrównania stanu faktycznego ze stanem pożądanym klastra?

**A:** Pętla sterowania (control loop).

---

## Card 50

**Q:** Który element klastra umożliwia dostęp do logów aplikacji przez polecenie 'kubectl logs'?

**A:** Mechanizm logowania (Logging) oraz kubelet (pośrednio).

---
