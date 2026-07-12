# Kubernetes Quiz

## Question 1
Który komponent warstwy sterowania (control plane) odpowiada za wybór odpowiedniego węzła (node) dla nowo utworzonych obiektów Pod?

- [x] kube-scheduler
- [ ] kube-apiserver
- [ ] etcd
- [ ] kubelet

**Hint:** Zastanów się, który moduł analizuje wymagania sprzętowe i polityki, aby zdecydować, gdzie uruchomić aplikację.

## Question 2
Jaką funkcję w klastrze Kubernetes pełni etcd?

- [x] Przechowuje całą konfigurację oraz aktualny stan klastra w formie klucz-wartość.
- [ ] Zarządza regułami sieciowymi i przekierowaniem ruchu do kontenerów.
- [ ] Umożliwia użytkownikom interakcję z klastrem za pomocą interfejsu graficznego.
- [ ] Służy do przechowywania obrazów kontenerów wewnątrz klastra.

**Hint:** Pomyśl o mechanizmie, który musi być odporny na awarie i zapewniać spójność danych systemowych.

## Question 3
W jakiej sytuacji w klastrze zazwyczaj NIE występuje komponent cloud-controller-manager?

- [x] Gdy klaster jest uruchomiony lokalnie na komputerze osobistym lub we własnej infrastrukturze (on-premises).
- [ ] Gdy w klastrze działa więcej niż jeden węzeł typu master.
- [ ] Gdy aplikacje uruchamiane wewnątrz podów nie wymagają dostępu do sieci internet.
- [ ] Gdy wszystkie węzły robocze korzystają z systemu operacyjnego Linux.

**Hint:** Zastanów się, czy środowisko takie jak minikube lub prywatne centrum danych potrzebuje kodu do obsługi zewnętrznych load balancerów chmurowych.

## Question 4
Czym jest Pod w architekturze Kubernetes?

- [x] Najmniejszą jednostką obliczeniową, która grupuje jeden lub więcej kontenerów z współdzielonymi zasobami.
- [ ] Wirtualną maszyną, na której zainstalowano oprogramowanie kubelet.
- [ ] Procesem w systemie operacyjnym odpowiedzialnym za harmonogramowanie zadań.
- [ ] Zestawem reguł bezpieczeństwa definiujących dostęp do API.

**Hint:** To nie jest pojedynczy kontener, lecz opakowanie, które może zawierać ich kilka, dzieląc między nimi sieć.

## Question 5
Jaka jest główna odpowiedzialność agenta kubelet?

- [x] Zapewnienie, że kontenery opisane w otrzymanych specyfikacjach (PodSpecs) są uruchomione i działają poprawnie.
- [ ] Przyjmowanie zewnętrznych żądań HTTP i przekazywanie ich do warstwy sterowania.
- [ ] Wybieranie obrazów kontenerów, które najlepiej pasują do specyfikacji sprzętowej węzła.
- [ ] Zarządzanie klastrową bazą danych etcd.

**Hint:** Skup się na roli 'nadzorcy' na poziomie pojedynczego węzła, który dba o lokalne kontenery.

## Question 6
Który z wymienionych elementów jest uznawany za dodatek (addon) w Kubernetes?

- [x] Cluster DNS
- [ ] kube-apiserver
- [ ] container runtime
- [ ] etcd

**Hint:** Pomyśl o zasobach, które zazwyczaj rezydują w przestrzeni nazw kube-system i służą do odkrywania usług.

## Question 7
Do czego służy komponent kube-proxy?

- [x] Do utrzymywania reguł sieciowych na węzłach, co umożliwia komunikację z podami z wewnątrz i zewnątrz klastra.
- [ ] Do monitorowania zużycia pamięci i procesora przez poszczególne kontenery.
- [ ] Do uwierzytelniania użytkowników korzystających z narzędzia kubectl.
- [ ] Do automatycznego restartowania zawieszonych węzłów fizycznych.

**Hint:** Kluczowym słowem jest tutaj obsługa obiektu 'Service' na poziomie sieciowym.

## Question 8
Czym charakteryzuje się implementacja kube-controller-manager?

- [x] Uruchamia wiele logicznie oddzielnych procesów kontrolnych skompilowanych w jeden plik binarny.
- [ ] Działa wyłącznie na węzłach roboczych, nigdy na maszynach control plane.
- [ ] Jest odpowiedzialny za bezpośrednie pobieranie obrazów z Docker Hub.
- [ ] Wymaga ręcznej konfiguracji każdego podu z osobna.

**Hint:** Zastanów się, w jaki sposób Kubernetes łączy różne pętle sterowania (np. Node controller, Job controller) w celu optymalizacji zasobów.

## Question 9
Narzędzie kubectl służy przede wszystkim do:

- [x] Interakcji z klastrem Kubernetes z poziomu wiersza poleceń.
- [ ] Kompilowania kodu źródłowego aplikacji do obrazów kontenerów.
- [ ] Zarządzania fizycznym chłodzeniem serwerów w serwerowni.
- [ ] Pełnienia roli głównego serwera DNS w klastrze.

**Hint:** Pomyśl o głównym narzędziu, którego używa administrator do wydawania poleceń klastrowi.

## Question 10
Co dzieje się, gdy w klastrze używany jest plugin sieciowy z własną implementacją proxy?

- [x] Węzły nie muszą uruchamiać standardowego komponentu kube-proxy.
- [ ] Warstwa sterowania automatycznie wyłącza bazę danych etcd.
- [ ] Klaster przestaje wspierać obiekty typu Service.
- [ ] Wszystkie pody muszą zostać zrestartowane w trybie uprzywilejowanym.

**Hint:** Zwróć uwagę na opcjonalność niektórych komponentów węzła w zależności od konfiguracji sieciowej.
