// Paquete principal para el Core de Banda Ancha Móvil (BAM) en una red celular
package 'Mobile_Broadband_Core' {

    // Definición del core de la red celular
    part def CoreNetwork {
        part sgw : SGW;    // Serving Gateway (SGW)
        part pgw : PGW;    // Packet Gateway (PGW)
        part hss : HSS;    // Home Subscriber Server (HSS)
        part cmm : CMM;    // Core Management Module (CMM)
        part dra : DRA;    // Diameter Routing Agent (DRA)
        part nds : NDS;    // Network Directory Server (NDS)
        part tn3 : TN3;    // Transport Network Node (TN3)
        part pcrf : PCRF;  // Policy and Charging Rules Function (PCRF)
        part eir : EIR;    // Equipment Identity Register (EIR)

        // Conexiones entre los elementos de la red celular
        connection sgwToPgw : S5S8Connection {
            end sgwEnd ::> sgw.s5s8Interface;
            end pgwEnd ::> pgw.s5s8Interface;
        }

        connection pgwToPcrf : GxConnection {
            end pgwEnd ::> pgw.gxInterface;
            end pcrfEnd ::> pcrf.gxInterface;
        }

        connection hssToCmm : CxConnection {
            end hssEnd ::> hss.cxInterface;
            end cmmEnd ::> cmm.cxInterface;
        }

        connection hssToPcrf : S6aConnection {
            end hssEnd ::> hss.s6aInterface;
            end pcrfEnd ::> pcrf.s6aInterface;
        }

        connection hssToEir : S13Connection {
            end hssEnd ::> hss.s13Interface;
            end eirEnd ::> eir.s13Interface;
        }

        connection draToPgw : S6bConnection {
            end draEnd ::> dra.s6bInterface;
            end pgwEnd ::> pgw.s6bInterface;
        }

        connection ndsToTn3 : Tn3Connection {
            end ndsEnd ::> nds.tn3Interface;
            end tn3End ::> tn3.tn3Interface;
        }

        connection draToCmm : DiameterConnection {
            end draEnd ::> dra.diameterInterface;
            end cmmEnd ::> cmm.diameterInterface;
        }
    }

    // Definiciones de elementos de red

    // SGW (Serving Gateway)
    part def SGW {
        port s5s8Interface : S5S8Port; // Interfaz S5/S8 con el PGW
    }

    // PGW (Packet Gateway)
    part def PGW {
        port s5s8Interface : S5S8Port;  // Interfaz S5/S8 con el SGW
        port gxInterface : GxPort;      // Interfaz Gx con el PCRF
        port s6bInterface : S6bPort;    // Interfaz S6b con el DRA
    }

    // HSS (Home Subscriber Server)
    part def HSS {
        port cxInterface : CxPort;      // Interfaz Cx con el CMM
        port s6aInterface : S6aPort;    // Interfaz S6a con el PCRF
        port s13Interface : S13Port;    // Interfaz S13 con el EIR
    }

    // CMM (Core Management Module)
    part def CMM {
        port cxInterface : CxPort;      // Interfaz Cx con el HSS
        port diameterInterface : DiameterPort; // Interfaz Diameter con el DRA
    }

    // DRA (Diameter Routing Agent)
    part def DRA {
        port s6bInterface : S6bPort;    // Interfaz S6b con el PGW
        port diameterInterface : DiameterPort; // Interfaz Diameter con el CMM
    }

    // NDS (Network Directory Server)
    part def NDS {
        port tn3Interface : TN3Port;    // Interfaz TN3 con el TN3
    }

    // TN3 (Transport Network Node)
    part def TN3 {
        port tn3Interface : TN3Port;    // Interfaz TN3 con el NDS
    }

    // PCRF (Policy and Charging Rules Function)
    part def PCRF {
        port gxInterface : GxPort;      // Interfaz Gx con el PGW
        port s6aInterface : S6aPort;    // Interfaz S6a con el HSS
    }

    // EIR (Equipment Identity Register)
    part def EIR {
        port s13Interface : S13Port;    // Interfaz S13 con el HSS
    }

    // Definición de conexiones entre los elementos de red

    connection def S5S8Connection {
        end sgwEnd : S5S8Port;
        end pgwEnd : S5S8Port;
    }

    connection def GxConnection {
        end pgwEnd : GxPort;
        end pcrfEnd : GxPort;
    }

    connection def CxConnection {
        end hssEnd : CxPort;
        end cmmEnd : CxPort;
    }

    connection def S6aConnection {
        end hssEnd : S6aPort;
        end pcrfEnd : S6aPort;
    }

    connection def S13Connection {
        end hssEnd : S13Port;
        end eirEnd : S13Port;
    }

    connection def S6bConnection {
        end draEnd : S6bPort;
        end pgwEnd : S6bPort;
    }

    connection def Tn3Connection {
        end ndsEnd : TN3Port;
        end tn3End : TN3Port;
    }

    connection def DiameterConnection {
        end draEnd : DiameterPort;
        end cmmEnd : DiameterPort;
    }

    // Definición de puertos para las interfaces

    port def S5S8Port;     // Interfaz S5/S8 entre SGW y PGW
    port def GxPort;       // Interfaz Gx entre PGW y PCRF
    port def CxPort;       // Interfaz Cx entre HSS y CMM
    port def S6aPort;      // Interfaz S6a entre HSS y PCRF
    port def S13Port;      // Interfaz S13 entre HSS y EIR
    port def S6bPort;      // Interfaz S6b entre DRA y PGW
    port def TN3Port;      // Interfaz TN3 entre NDS y TN3
    port def DiameterPort; // Interfaz Diameter entre DRA y CMM

}