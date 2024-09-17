# sysml_v2_pkg_Mobile_Broadband_Core
El modelo **Core de Banda Ancha Móvil (BAM)** representa los principales elementos de red en una arquitectura celular, centrándose en los 'Network Elements' y las conexiones estándar que los interconectan.

# Resumen del Modelo Core de Banda Ancha Móvil

El modelo **Core de Banda Ancha Móvil (BAM)** representa los principales elementos de red en una arquitectura celular, centrándose en los **Network Elements** y las conexiones estándar que los interconectan. Los componentes clave se detallan a continuación:

## Elementos Principales del Core de Red

1. **SGW (Serving Gateway)**
   - Función: Encargado de enrutar y reenviar paquetes entre la red de acceso y el Packet Gateway.
   - Interfaz: `S5S8Port` (Conecta al PGW a través de la interfaz S5/S8).

2. **PGW (Packet Gateway)**
   - Función: Enlace entre la red móvil y redes externas (Internet), responsable de políticas de datos y enrutamiento.
   - Interfaces: 
     - `S5S8Port`: Conexión al SGW.
     - `GxPort`: Conexión al PCRF para gestión de políticas.
     - `S6bPort`: Conexión al DRA.

3. **HSS (Home Subscriber Server)**
   - Función: Base de datos central de la red que gestiona la información de suscriptores y autentica usuarios.
   - Interfaces:
     - `CxPort`: Conexión al CMM.
     - `S6aPort`: Conexión al PCRF.
     - `S13Port`: Conexión al EIR.

4. **CMM (Core Management Module)**
   - Función: Módulo de gestión central del Core de la red.
   - Interfaces:
     - `CxPort`: Conexión al HSS.
     - `DiameterPort`: Conexión al DRA.

5. **DRA (Diameter Routing Agent)**
   - Función: Encargado del enrutamiento de mensajes Diameter dentro de la red.
   - Interfaces:
     - `S6bPort`: Conexión al PGW.
     - `DiameterPort`: Conexión al CMM.

6. **NDS (Network Directory Server)**
   - Función: Servidor de directorios que proporciona servicios de red y enrutamiento.
   - Interfaz: `TN3Port` (Conecta al TN3).

7. **TN3 (Transport Network Node)**
   - Función: Nodo de red que soporta la comunicación de transporte.
   - Interfaz: `TN3Port` (Conecta al NDS).

8. **PCRF (Policy and Charging Rules Function)**
   - Función: Define las reglas de políticas de red y gestión de calidad de servicio (QoS).
   - Interfaces:
     - `GxPort`: Conexión al PGW.
     - `S6aPort`: Conexión al HSS.

9. **EIR (Equipment Identity Register)**
   - Función: Registra y verifica la identidad de los equipos conectados a la red.
   - Interfaz: `S13Port` (Conecta al HSS).

## Conexiones Principales

1. **S5S8Connection**: Conexión entre el SGW y PGW a través de la interfaz `S5S8Port`.
2. **GxConnection**: Conexión entre el PGW y PCRF utilizando la interfaz `GxPort`.
3. **CxConnection**: Conexión entre el HSS y CMM utilizando la interfaz `CxPort`.
4. **S6aConnection**: Conexión entre el HSS y PCRF utilizando la interfaz `S6aPort`.
5. **S13Connection**: Conexión entre el HSS y EIR utilizando la interfaz `S13Port`.
6. **S6bConnection**: Conexión entre el DRA y PGW utilizando la interfaz `S6bPort`.
7. **TN3Connection**: Conexión entre el NDS y TN3 utilizando la interfaz `TN3Port`.
8. **DiameterConnection**: Conexión entre el DRA y CMM utilizando la interfaz `DiameterPort`.

Este modelo refleja la estructura básica del core de una red celular moderna, siguiendo las interfaces y protocolos estándar en la industria de telecomunicaciones para garantizar la interoperabilidad entre los distintos elementos de la red.
