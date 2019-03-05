function varargout = ProgramaKS(varargin)
    % PROGRAMAKS M-file for ProgramaKS.fig
    % Last Modified by GUIDE v2.5 05-Jul-2014 07:23:29

    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @ProgramaKS_OpeningFcn, ...
                       'gui_OutputFcn',  @ProgramaKS_OutputFcn, ...
                       'gui_LayoutFcn',  [] , ...
                       'gui_Callback',   []);
    if nargin && ischar(varargin{1})
        gui_State.gui_Callback = str2func(varargin{1});
    end

    if nargout
        [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
    else
        gui_mainfcn(gui_State, varargin{:});
    end

end

function ProgramaKS_OpeningFcn(hObject, eventdata, handles, varargin)
    handles.output = hObject;
    guidata(hObject, handles);
    clc
    %COLOR DE FONDO
    set(handles.PanelPantalla,'backgroundcolor',[0.941 0.941 0.941]);
    %TEXTO INTEGRANTES
    txtKc = uicontrol(handles.PanelPantalla,...
        'Tag','txtKc',...
        'style','text',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',15,...
        'position',[ 0.03 0.1 0.15 0.08],...
        'string','Kevin Santiago Chaca Benavides',...
        'backgroundcolor',[0.941 0.941 0.941]);
    txtFn = uicontrol(handles.PanelPantalla,...
        'Tag','txtFn',...
        'style','text',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',15,...
        'position',[ 0.18 0.1 0.15 0.08],...
        'string','Fabian Andres Naula Valdivieso',...
        'backgroundcolor',[0.941 0.941 0.941]);
    txtGj = uicontrol(handles.PanelPantalla,...
        'Tag','txtGj',...
        'style','text',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',15,...
        'position',[  0.33 0.1 0.15 0.08],...
        'string','Gino Geovanny Jaramillo Pizarro',...
        'backgroundcolor',[0.941 0.941 0.941]);
    txtCs = uicontrol(handles.PanelPantalla,...
        'Tag','txtCs',...
        'style','text',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',15,...
        'position',[  0.5 0.1 0.15 0.08],...
        'string','Christian Eduardo Sanchez Ayora',...
        'backgroundcolor',[0.941 0.941 0.941]);
    txtFt = uicontrol(handles.PanelPantalla,...
        'Tag','txtFt',...
        'style','text',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',15,...
        'position',[  0.65 0.1 0.15 0.08],...
        'string','Felipe Andres Torres Espinoza',...
        'backgroundcolor',[0.941 0.941 0.941]);
    txtMz = uicontrol(handles.PanelPantalla,...
        'Tag','txtMz',...
        'style','text',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',15,...
        'position',[  0.8 0.1 0.15 0.08],...
        'string','Mateo Xavier Zu�iga Ximenes',...
        'backgroundcolor',[0.941 0.941 0.941]);

    %UNIVERSIDAD DE CUENCA
    txtUcuenca = uicontrol(handles.PanelPantalla,...
        'Tag','txtUcue',...
        'style','text',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',35,...
        'fontWeight','bold',...
        'position',[ 0.22 0.87 0.55 0.09],...
        'string','UNIVERSIDAD DE CUENCA',...
        'backgroundcolor',[0.941 0.941 0.941]);

    %Logo de la Universidad
    logo = axes('Units','pixels','Position',[530,330,150,150],'Tag','FigLogo');
    fondo = imread('Ucuenca.jpg');
    imshow(fondo);

    %Microondas
    txtMicroondas = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',30,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'position',[ 0.3 0.48 0.4 0.08],...
        'string','Trabajo de Microondas',...
        'backgroundcolor',[0.941 0.941 0.941]);

    %analsisi del uso
    txtAnalisis = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',25,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'position',[ 0.18 0.35 0.7 0.12],...
        'string','ANALISIS DEL USO DEL ESPECTRO RADIOELECTRICO EN EL AUSTRO DEL PAIS',...
        'backgroundcolor',[0.941 0.941 0.941]);

    %Ingenieria
    txtIng = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',20,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'position',[ 0.22 0.2 0.6 0.06],...
        'string','Ingenieria en Electronica y Telecomunicaciones',...
        'backgroundcolor',[0.941 0.941 0.941]);

    %LEER TABLAS
    global TablaSiraTv TablaSCDMA450 TablaFWA TablaEnlaces TablaVHFUHF TablaMDBA TablaAuxiliares;
    [num,text,TablaSiraTv]=xlsread('SIRATV MARZO 2014.xlsx','SIRATV MARZO 2014');
    %[num,text,TablaSCDMA450]=xlsread('Radiobases-FWA Y CDMA45 2014.xls','CDMA 450');
    %[num,text,TablaFWA]=xlsread('Radiobases-FWA Y CDMA45 2014.xls','FWA');
    [num,text,TablaEnlaces]=xlsread('CONCESIONARIOS REGIONAL AUSTRO(10-03-2014).xls','ENLACES');
    [num,text,TablaVHFUHF]=xlsread('CONCESIONARIOS REGIONAL AUSTRO(10-03-2014).xls','VHF-UHF');
    [num,text,TablaMDBA]=xlsread('CONCESIONARIOS REGIONAL AUSTRO(10-03-2014).xls','ENLACES MDBA');
    [num,text,TablaAuxiliares]=xlsread('AUXILIARES MARZO 2014.xlsx','AUXILIARES MARZO 2014');
end

function varargout = ProgramaKS_OutputFcn(hObject, eventdata, handles) 
    varargout{1} = handles.output;
end


%INFORMACION ESPECTRO AUSTRO
function InformacionAntena_Callback(hObject, eventdata, handles)
    %Borrar elementos de la interfaz y cambiar el titulo del Panel 
    HandlePanelPantalla = get(handles.PanelPantalla);
    HandleVentana = get(handles.figure1);
    set(handles.PanelPantalla,'Title','INFORMACION TABLAS');
    delete(HandlePanelPantalla.Children);
    for k = 1:length(HandleVentana.Children)
        child = get(HandleVentana.Children(k));
        tag = child.Tag;            
        switch tag
            case 'Enlaces'
            case 'EstacionesBase'
            case 'PanelPantalla'
            case 'uitoolbar3'
            otherwise
                delete(HandleVentana.Children(k));
        end
    end

    %Variables Globales Tablas
    global TablaSiraTv TablaSCDMA450 TablaFWA TablaEnlaces TablaVHFUHF TablaMDBA TablaAuxiliares;
      
    %RadioButtons para seleccionar base de Datos
    SIRATV = uicontrol(handles.PanelPantalla,...
        'style','radiobutton',...
        'units','normalized',...
        'fontsize',12,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.03 0.92 0.08 0.045],...
        'string','SIRA TV',...
        'Tag','RB1',...
        'backgroundcolor',[0.941 0.941 0.941]);
   
    %CALLBACK Radio Button SIRATV
    set(SIRATV,'Callback',@CallBackSiraTV);
    function CallBackSiraTV(source,eventdata)
        
        %Seleccion de la Tabla SIRATV
        Tabla = TablaSiraTv;
        [filas columnas] = size(Tabla);
        
        %Poner los demas radioButtons como deseleccionados
        set(SIRATV,'Value',1);
        set(SCDMA,'Value',0);
        set(FWA,'Value',0);
        set(ENLACES,'Value',0);
        set( VHFUHF,'Value',0);
        set(MDBA,'Value',0);
        set(AUXILIARES,'Value',0);
        
        %BORRAR TODO DE LA PANTALLA
        HandlePanelPantalla = get(handles.PanelPantalla);
        for k = 1:length(HandlePanelPantalla.Children)
            child = get(HandlePanelPantalla.Children(k));
            tag = child.Tag;            
            switch tag
                case 'RB1'
                case 'RB2'
                case 'RB3'
                case 'RB4'
                case 'RB5'
                case 'RB6'
                case 'RB7'    
                otherwise
                    delete(HandlePanelPantalla.Children(k));
            end
        end
        HandleVentana = get(handles.figure1);
        for k = 1:length(HandleVentana.Children)
            child = get(HandleVentana.Children(k));
            tag = child.Tag;            
            switch tag
                case 'Enlaces'
                case 'EstacionesBase'
                case 'PanelPantalla'
                case 'uitoolbar3'
                case 'GrupoBaseDatos'
                otherwise
                    delete(HandleVentana.Children(k));
            end
        end

        
        %RADIO BUTTONS PARA SELECCIONAR CATEGORIA
        GrupoCategorias = uibuttongroup(...
            'visible','on',...
            'fontsize',10,...
            'FontName','Times New Roman',...
            'Position',[0.025 0.15 0.23 0.65],...
            'Title','CATEGORIAS',...
            'Tag', 'GrupoCategorias',...
            'backgroundcolor',[ 0.941 0.941 0.941]);
        
        %AMPLITUD MODULADA        
        AM = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.78 0.15 0.04],...
            'string','AMPLITUD MODULADA',...
            'Tag','AM',...
            'backgroundcolor',[0.941 0.941 0.941]);        
                 
        %CALLBACK Radio Button AMPLITUD MODULADA
        set(AM,'Callback',@CallBackAM);
        function CallBackAM(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AM,'Value',1);
            set(FM,'Value',0);
            set(TELEVISIONABIERTA,'Value',0);
            set(ONDACORTA,'Value',0);
            set(TELEVISIONCODIFICADASATELITAL,'Value',0);
            set(TELEVISIONCODIFICADATERRESTRE,'Value',0);
            set(TELEVISIONDIGITALTERRESTRE,'Value',0);
            set(TELEVISIONCABLE,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'TVABIERTA'
                    case 'ONDACORTA'
                    case 'TELEVISIONCODIFICADASATELITAL'
                    case 'TELEVISIONCODIFICADATERRESTRE'
                    case 'TELEVISIONDIGITALTERRESTRE'
                    case 'TELEVISIONCABLE'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoCategorias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
                       
            %Graficar Espectro y Crear Lista Consecionarios
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'Frecuencia')==1)
                    columnaFrecuencia = j;
                end
                if(strcmp( Tabla(1,j ),'Categor�a')==1)
                    columnaCategoria = j;
                end
                if(strcmp( Tabla(1,j ),'Provincia')==1)
                    columnaProvincia = j;
                end
                if(strcmp( Tabla(1,j ),'Potencia Enlace')==1)
                    columnaPotencia = j;
                end
                if(strcmp( Tabla(1,j ),'Concesionario')==1)
                    columnaConcesionarios = j;
                end
            end
            concesionario= repmat({''},1,filas);
            filasConcesionario=zeros(1,filas);
            vectorFrecuenciasAzuay=zeros(1,filas);
            vectorPotenciasAzuay=zeros(1,filas);
            vectorFrecuenciasCanar=zeros(1,filas);
            vectorPotenciasCanar=zeros(1,filas);
            vectorFrecuenciasLoja=zeros(1,filas);
            vectorPotenciasLoja=zeros(1,filas);
            vectorFrecuenciasZamora=zeros(1,filas);
            vectorPotenciasZamora=zeros(1,filas);
            vectorFrecuenciasMorona=zeros(1,filas);
            vectorPotenciasMorona=zeros(1,filas);
            vectorFrecuenciasOro=zeros(1,filas);
            vectorPotenciasOro=zeros(1,filas);
            cont=0;
            contA=0;
            contC=0;
            contL=0;
            contZ=0;
            contM=0;
            contO=0;
            for k= 2:filas       
                frec = Tabla{k,columnaFrecuencia};
                cat = Tabla(k,columnaCategoria);
                prov= Tabla{k,columnaProvincia};
                pot= Tabla{k,columnaPotencia};
                conse= Tabla(k,columnaConcesionarios);
                if strcmp(cat,'AMPLITUD MODULADA')==1
                    switch prov
                        case 'AZUAY'
                            contA=contA+1;
                            if isa(frec,'double') ==1
                                vectorFrecuenciasAzuay(contA)= frec;
                            else
                                vectorFrecuenciasAzuay(contA)=conversionDecimal(frec);
                            end
                            if isa(pot,'double') ==1
                                vectorPotenciasAzuay(contA)= pot/1000;
                            else
                                vectorPotenciasAzuay(contA)=conversionDecimal(pot)/1000;
                            end
                            cont = cont + 1;
                            concesionario(cont)= conse;
                            filasConcesionario(cont)= k;
                            
                        case 'CA�AR'
                            contC=contC+1;
                            if isa(frec,'double') ==1
                                vectorFrecuenciasCanar(contC)= frec;
                            else
                                vectorFrecuenciasCanar(contC)=conversionDecimal(frec);
                            end
                            if isa(pot,'double') ==1
                                vectorPotenciasCanar(contC)= pot/1000;
                            else
                                vectorPotenciasCanar(contC)=conversionDecimal(pot)/1000;
                            end
                            cont = cont + 1;
                            concesionario(cont)= conse;
                            filasConcesionario(cont)= k; 
                        case 'LOJA'
                            contL=contL+1;
                            if isa(frec,'double') ==1
                                vectorFrecuenciasLoja(contL)= frec;
                            else
                                vectorFrecuenciasLoja(contL)=conversionDecimal(frec);
                            end
                            if isa(pot,'double') ==1
                                vectorPotenciasLoja(contL)= pot/1000;
                            else
                                vectorPotenciasLoja(contL)=conversionDecimal(pot)/1000;
                            end
                            cont = cont + 1;
                            concesionario(cont)= conse;
                            filasConcesionario(cont)= k;
                        case 'ZAMORA CHINCHIPE'
                            contZ=contZ+1;
                            if isa(frec,'double') ==1
                                vectorFrecuenciasZamora(contZ)= frec;
                            else
                                vectorFrecuenciasZamora(contZ)=conversionDecimal(frec);
                            end
                            if isa(pot,'double') ==1
                                vectorPotenciasZamora(contZ)= pot/1000;
                            else
                                vectorPotenciasZamora(contZ)=conversionDecimal(pot)/1000;
                            end
                            cont = cont + 1;
                            concesionario(cont)= conse;
                            filasConcesionario(cont)= k;
                         case 'MORONA SANTIAGO'
                            contM=contM+1;
                            if isa(frec,'double') ==1
                                vectorFrecuenciasMorona(contM)= frec;
                            else
                                vectorFrecuenciasMorona(contM)=conversionDecimal(frec);
                            end
                            if isa(pot,'double') ==1
                                vectorPotenciasMorona(contM)= pot/1000;
                            else
                                vectorPotenciasMorona(contM)=conversionDecimal(pot)/1000;
                            end
                            cont = cont + 1;
                            concesionario(cont)= conse;
                            filasConcesionario(cont)= k;
                        case 'EL ORO'
                            contO=contO+1;
                            if isa(frec,'double') ==1
                                vectorFrecuenciasOro(contO)= frec;
                            else
                                vectorFrecuenciasOro(contO)=conversionDecimal(frec);
                            end
                            if isa(pot,'double') ==1
                                vectorPotenciasOro(contO)= pot/1000;
                            else
                                vectorPotenciasOro(contO)=conversionDecimal(pot)/1000;
                            end
                            cont = cont + 1;
                            concesionario(cont)= conse;
                            filasConcesionario(cont)= k;
                            %%%%%%%%%%%%%%%%%%%%%%
                            %%%%%%%%%%%%%%%%%%%%
                            %%%%%%%%%%%%%%
                    end
                    if strcmp(prov,'AZUAY')==1 || strcmp(prov,'CA�AR')==1||...
                       strcmp(prov,'LOJA')==1 ||strcmp(prov,'MORONA SANTIAGO')==1||...
                       strcmp(prov,'ZAMORA CHINCHIPE')==1 ||strcmp(prov,'EL ORO')==1
                        cont = cont+1;
                        vectorFrecuencias(cont)=frec;
                        vectorPotencias(cont) = pot/1000;
                        concesionario(cont)= conse;
                        filasConcesionario(cont)= k;
                    end
                end
            end
            concesionario = concesionario(1:cont);
            filasConcesionario = filasConcesionario(1:cont);
            if contA>0
                vectorFrecuenciasAzuay=vectorFrecuenciasAzuay(1:contA);
                vectorPotenciasAzuay=vectorPotenciasAzuay(1:contA);
            end
            if contC>0
                vectorFrecuenciasCanar=vectorFrecuenciasCanar(1:contC);
                vectorPotenciasCanar=vectorPotenciasCanar(1:contC);
            end
            if contL>0
                vectorFrecuenciasLoja=vectorFrecuenciasLoja(1:contL);
                vectorPotenciasLoja=vectorPotenciasLoja(1:contL);
            end
            if contZ>0
                vectorFrecuenciasZamora=vectorFrecuenciasZamora(1:contZ);
                vectorPotenciasZamora=vectorPotenciasZamora(1:contZ);
            end
            if contM>0
                vectorFrecuenciasMorona=vectorFrecuenciasMorona(1:contM);
                vectorPotenciasMorona=vectorPotenciasMorona(1:contM);
            end
            if contO>0
                vectorFrecuenciasOro=vectorFrecuenciasOro(1:contO);
                vectorPotenciasOro=vectorPotenciasOro(1:contO);
            end
            %Texto ESPECTRO DE FRECUENCIAS
            espFrecuenciasAM = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.35 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA
            FigEspAM= axes('Units','pixels','Position',[350,50,600,400],'Tag','FigEspAM');
            stem(vectorFrecuenciasAzuay,vectorPotenciasAzuay,...
                'LineStyle','-',...
                'MarkerFaceColor','b',...
                'MarkerEdgeColor','b',...
                'Color','b',...
                'Marker','o',...
                'LineWidth',1.5);
            hold on;
            stem(vectorFrecuenciasCanar,vectorPotenciasCanar,...
                'LineStyle','-',...
                'MarkerFaceColor','g',...
                'MarkerEdgeColor','g',...
                'Color','g',...
                'Marker','o',...
                'LineWidth',1.5);
            stem(vectorFrecuenciasLoja,vectorPotenciasLoja,...
                'LineStyle','-',...
                'MarkerFaceColor','k',...
                'MarkerEdgeColor','k',...
                'Color','k',...
                'Marker','o',...
                'LineWidth',1.5);
            stem(vectorFrecuenciasZamora,vectorPotenciasZamora,...
                'LineStyle','-',...
                'MarkerFaceColor','c',...
                'MarkerEdgeColor','c',...
                'Color','c',...
                'Marker','o',...
                'LineWidth',1.5);
            stem(vectorFrecuenciasMorona,vectorPotenciasMorona,...
                'LineStyle','-',...
                'MarkerFaceColor','m',...
                'MarkerEdgeColor','m',...
                'Color','m',...
                'Marker','o',...
                'LineWidth',1.5);
            stem(vectorFrecuenciasOro,vectorPotenciasOro,...
                'LineStyle','-',...
                'MarkerFaceColor','y',...
                'MarkerEdgeColor','y',...
                'Color','y',...
                'Marker','o',...
                'LineWidth',1.5);
            hold off;
            xlabel('Frecuencia [KHz]');
            ylabel('Potencia [W]');
            grid on;
            
            %Texto Colores 
            txtColores = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',9,...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.02 0.02 0.21 0.12],...
                'string','Azuay: AZUL; Ca�ar: VERDE; loja: NEGRO; Zamora:CELESTE; Morona:MAGENTA; El Oro: AMARILLO',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Texto Consesionarios 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.85 0.81 0.11 0.04],...
                'string','Concesionarios:',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
             %PopMenu Consesionarios
             popMenuConcesionariosAM =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',concesionario(:),...
                'position',[ 0.81 0.76 0.2 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);         
            
            %CALLBACK Pop Menu Concesionarios
            set(popMenuConcesionariosAM,'Callback',@CallBackpopMenuConcesionariosAM);
            function CallBackpopMenuConcesionariosAM(source2,eventdata)
                %Mostrar Datos de Consesionaria
                tablaConcesionarios =  uicontrol(handles.PanelPantalla,...
                    'Tag','tboxNombres',...
                    'style','listbox',...
                    'units','normalized',...
                    'HorizontalAlignment','center',...
                    'fontsize',10,...
                    'position',[ 0.82 0.02 0.18 0.75],...
                    'backgroundcolor',[0.941 0.941 0.941]);
                
                valor= get(source2,'Value');
                
                posicionFila = filasConcesionario(valor);
                %Remarcar En la Figura
                cla
                fc = Tabla{posicionFila,columnaFrecuencia};
                pt = Tabla{posicionFila,columnaPotencia};
                if isa(fc,'double') ==1
                    frec=fc;
                else
                    frec=conversionDecimal(fc);
                end
                if isa(pt,'double') ==1
                    pot=pt;
                else
                    pot=conversionDecimal(pt);
                end
                pot=pot/1000;
                stem(vectorFrecuenciasAzuay,vectorPotenciasAzuay,...
                    'LineStyle','-',...
                    'MarkerFaceColor','b',...
                    'MarkerEdgeColor','b',...
                    'Color','b',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                stem(vectorFrecuenciasCanar,vectorPotenciasCanar,...
                    'LineStyle','-',...
                    'MarkerFaceColor','g',...
                    'MarkerEdgeColor','g',...
                    'Color','g',...
                    'Marker','o',...
                    'LineWidth',1.5);
                stem(vectorFrecuenciasLoja,vectorPotenciasLoja,...
                    'LineStyle','-',...
                    'MarkerFaceColor','k',...
                    'MarkerEdgeColor','k',...
                    'Color','k',...
                    'Marker','o',...
                    'LineWidth',1.5);
                stem(vectorFrecuenciasZamora,vectorPotenciasZamora,...
                    'LineStyle','-',...
                    'MarkerFaceColor','c',...
                    'MarkerEdgeColor','c',...
                    'Color','c',...
                    'Marker','o',...
                    'LineWidth',1.5);
                stem(vectorFrecuenciasMorona,vectorPotenciasMorona,...
                    'LineStyle','-',...
                    'MarkerFaceColor','m',...
                    'MarkerEdgeColor','m',...
                    'Color','m',...
                    'Marker','o',...
                    'LineWidth',1.5);
                stem(vectorFrecuenciasOro,vectorPotenciasOro,...
                    'LineStyle','-',...
                    'MarkerFaceColor','y',...
                    'MarkerEdgeColor','y',...
                    'Color','y',...
                    'Marker','o',...
                    'LineWidth',1.5);
               h2 = stem(frec,pot,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','red',...
                        'Marker','o',...
                        'LineWidth',1.8);
                    hold off;
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                grid on;
               
                contador = 1;
                datos = cell(2*columnas,1);
                for z = 1 :columnas
                    if isa(Tabla{posicionFila,z},'double') ==1
                        aux = num2str( Tabla{posicionFila,z});
                    else
                        aux = Tabla{posicionFila,z};
                    end
                    datos(contador)= strcat(Tabla(1,z),': ',aux);
                    contador=contador+2;
                end
                set(tablaConcesionarios,'string',datos());
            end 

        end
        
        %FRECUENCIA MODULADA
        FM = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.7 0.15 0.04],...
            'string','FRECUENCIA MODULADA',...
            'Tag','FM',...
            'backgroundcolor',[0.941 0.941 0.941]);
        
        %CALLBACK Radio Button FRECUENCIA MODULADA
        set(FM,'Callback',@CallBackFM);
        function CallBackFM(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AM,'Value',0);
            set(FM,'Value',1);
            set(TELEVISIONABIERTA,'Value',0);
            set(ONDACORTA,'Value',0);
            set(TELEVISIONCODIFICADASATELITAL,'Value',0);
            set(TELEVISIONCODIFICADATERRESTRE,'Value',0);
            set(TELEVISIONDIGITALTERRESTRE,'Value',0);
            set(TELEVISIONCABLE,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'TVABIERTA'
                    case 'ONDACORTA'
                    case 'TELEVISIONCODIFICADASATELITAL'
                    case 'TELEVISIONCODIFICADATERRESTRE'
                    case 'TELEVISIONDIGITALTERRESTRE'
                    case 'TELEVISIONCABLE'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoCategorias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Graficar Espectro y Crear Lista Consecionarios
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'Frecuencia')==1)
                    columnaFrecuencia = j;
                end
                if(strcmp( Tabla(1,j ),'Categor�a')==1)
                    columnaCategoria = j;
                end
                if(strcmp( Tabla(1,j ),'Provincia')==1)
                    columnaProvincia = j;
                end
                if(strcmp( Tabla(1,j ),'Potencia Enlace')==1)
                    columnaPotencia = j;
                end
                if(strcmp( Tabla(1,j ),'Concesionario')==1)
                    columnaConcesionarios = j;
                end
            end
            cont=0;
            concesionario= repmat({''},1,filas);
            filasConcesionario=zeros(1,filas);
            vectorFrecuencias=zeros(1,filas);
            vectorPotencias=zeros(1,filas);
            for k= 2:filas       
                frec = Tabla{k,columnaFrecuencia};
                cat = Tabla(k,columnaCategoria);
                prov= Tabla(k,columnaProvincia);
                pot= Tabla{k,columnaPotencia};
                conse= Tabla(k,columnaConcesionarios);
                if strcmp(cat,'FRECUENCIA MODULADA')==1
                    if strcmp(prov,'AZUAY')==1 || strcmp(prov,'CA�AR')==1||...
                       strcmp(prov,'LOJA')==1 ||strcmp(prov,'MORONA SANTIAGO')==1||...
                       strcmp(prov,'ZAMORA CHINCHIPE')==1 ||strcmp(prov,'EL ORO')==1
                        cont = cont+1;
                        vectorFrecuencias(cont)=conversionDecimal(frec);
                        if isa(pot,'double') ==1
                            vectorPotencias(cont) = pot/1000;
                        else
                            vectorPotencias(cont) = conversionDecimal(pot)/1000;
                        end
                        
                        concesionario(cont)= conse;
                        filasConcesionario(cont)= k;
                    end
                end
            end
            concesionario = concesionario(1:cont);
            filasConcesionario = filasConcesionario(1:cont);
            vectorFrecuencias = vectorFrecuencias(1:cont);
            vectorPotencias = vectorPotencias(1:cont);
            %Texto ESPECTRO DE FRECUENCIAS
            espFrecuenciasFM = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.35 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA
            FigEspFM= axes('Units','pixels','Position',[350,50,600,400],'Tag','FigEspFM');
            stem(vectorFrecuencias,vectorPotencias,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [MHz]');
            ylabel('Potencia [W]');
            grid on;

            %Texto Consesionarios 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.85 0.81 0.11 0.04],...
                'string','Concesionarios:',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
             %PopMenu Consesionarios
             popMenuConcesionariosFM =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',concesionario(:),...
                'position',[ 0.81 0.76 0.2 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);         
            
            %CALLBACK Pop Menu Concesionarios
            set(popMenuConcesionariosFM,'Callback',@CallBackpopMenuConcesionariosFM);
            function CallBackpopMenuConcesionariosFM(source2,eventdata)
                %Mostrar Datos de Consesionaria
                tablaConcesionarios =  uicontrol(handles.PanelPantalla,...
                    'Tag','tboxNombres',...
                    'style','listbox',...
                    'units','normalized',...
                    'HorizontalAlignment','center',...
                    'fontsize',10,...
                    'position',[ 0.82 0.02 0.18 0.75],...
                    'backgroundcolor',[0.941 0.941 0.941]);
                
                valor= get(source2,'Value');
                
                posicionFila = filasConcesionario(valor);
                %Remarcar En la Figura
                cla
                fc = Tabla{posicionFila,columnaFrecuencia};
                pt = Tabla{posicionFila,columnaPotencia};
                frec=conversionDecimal(fc);
                if isa(pt,'double') ==1
                    pot = pt/1000;
                else
                    pot = conversionDecimal(pt)/1000;
                end

                stem(vectorFrecuencias,vectorPotencias,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                    hold on;
               h2 = stem(frec,pot,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','y',...
                        'Marker','o',...
                        'LineWidth',1.8);
                    hold off;
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                grid on;
               
                contador = 1;
                datos = cell(2*columnas,1);
                for z = 1 :columnas
                    if isa(Tabla{posicionFila,z},'double') ==1
                        aux = num2str( Tabla{posicionFila,z});
                    else
                        aux = Tabla{posicionFila,z};
                    end
                    datos(contador)= strcat(Tabla(1,z),': ',aux);
                    contador=contador+2;
                end
                set(tablaConcesionarios,'string',datos());
            end 

        end
        

        %TELEVISION ABIERTA
        TELEVISIONABIERTA = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.62 0.15 0.04],...
            'string','TELEVISION ABIERTA',...
            'Tag','TVABIERTA',...
            'backgroundcolor',[0.941 0.941 0.941]);        
        
        %CALLBACK Radio Button TELEVISION ABIERTA
        set(TELEVISIONABIERTA,'Callback',@CallBackTELEVISIONABIERTA);
        function CallBackTELEVISIONABIERTA(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AM,'Value',0);
            set(FM,'Value',0);
            set(TELEVISIONABIERTA,'Value',1);
            set(ONDACORTA,'Value',0);
            set(TELEVISIONCODIFICADASATELITAL,'Value',0);
            set(TELEVISIONCODIFICADATERRESTRE,'Value',0);
            set(TELEVISIONDIGITALTERRESTRE,'Value',0);
            set(TELEVISIONCABLE,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'TVABIERTA'
                    case 'ONDACORTA'
                    case 'TELEVISIONCODIFICADASATELITAL'
                    case 'TELEVISIONCODIFICADATERRESTRE'
                    case 'TELEVISIONDIGITALTERRESTRE'
                    case 'TELEVISIONCABLE'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoCategorias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Graficar Espectro y Crear Lista Consecionarios
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'Frecuencia')==1)
                    columnaFrecuencia = j;
                end
                if(strcmp( Tabla(1,j ),'Categor�a')==1)
                    columnaCategoria = j;
                end
                if(strcmp( Tabla(1,j ),'Provincia')==1)
                    columnaProvincia = j;
                end
                if(strcmp( Tabla(1,j ),'Potencia Enlace')==1)
                    columnaPotencia = j;
                end
                if(strcmp( Tabla(1,j ),'Concesionario')==1)
                    columnaConcesionarios = j;
                end
            end
            cont=0;
            concesionario= repmat({''},1,filas);
            filasConcesionario=zeros(1,filas);
            vectorFrecuencias=zeros(1,filas);
            vectorPotencias=zeros(1,filas);
            for k= 2:filas       
                frec = Tabla{k,columnaFrecuencia};
                cat = Tabla(k,columnaCategoria);
                prov= Tabla(k,columnaProvincia);
                pot= Tabla{k,columnaPotencia};
                conse= Tabla(k,columnaConcesionarios);
                if strcmp(cat,'TELEVISION ABIERTA')==1
                    if strcmp(prov,'AZUAY')==1 || strcmp(prov,'CA�AR')==1||...
                       strcmp(prov,'LOJA')==1 ||strcmp(prov,'MORONA SANTIAGO')==1||...
                       strcmp(prov,'ZAMORA CHINCHIPE')==1 ||strcmp(prov,'EL ORO')==1
                        cont = cont+1;
                        if isa(frec,'double') ==1
                            vectorFrecuencias(cont)=frec*10;
                        else
                            vectorFrecuencias(cont)=conversionDecimal(frec)*10;
                        end
                        if isa(pot,'double') ==1
                            vectorPotencias(cont) = pot/1000;
                        else
                            vectorPotencias(cont) = conversionDecimal(pot)/1000;
                        end
                        
                        concesionario(cont)= conse;
                        filasConcesionario(cont)= k;
                    end
                end
            end
            concesionario = concesionario(1:cont);
            filasConcesionario = filasConcesionario(1:cont);
            vectorFrecuencias = vectorFrecuencias(1:cont);
            vectorPotencias = vectorPotencias(1:cont);
            %Texto ESPECTRO DE FRECUENCIAS
            espFrecuenciasTELEVISIONABIERTA = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.35 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA
            FigEspTELEVISIONABIERTA= axes('Units','pixels','Position',[350,50,600,400],'Tag','FigEspTELEVISIONABIERTA');
            stem(vectorFrecuencias,vectorPotencias,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [MHz]');
            ylabel('Potencia [W]');
            grid on;

            %Texto Consesionarios 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.85 0.81 0.11 0.04],...
                'string','Concesionarios:',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
             %PopMenu Consesionarios
             popMenuConcesionariosTELEVISIONABIERTA =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',concesionario(:),...
                'position',[ 0.81 0.76 0.2 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);         
            
            %CALLBACK Pop Menu Concesionarios
            set(popMenuConcesionariosTELEVISIONABIERTA,'Callback',@CallBackpopMenuConcesionariosTELEVISIONABIERTA);
            function CallBackpopMenuConcesionariosTELEVISIONABIERTA(source2,eventdata)
                %Mostrar Datos de Consesionaria
                tablaConcesionarios =  uicontrol(handles.PanelPantalla,...
                    'Tag','tboxNombres',...
                    'style','listbox',...
                    'units','normalized',...
                    'HorizontalAlignment','center',...
                    'fontsize',10,...
                    'position',[ 0.82 0.02 0.18 0.75],...
                    'backgroundcolor',[0.941 0.941 0.941]);
                
                valor= get(source2,'Value');
                
                posicionFila = filasConcesionario(valor);
                %Remarcar En la Figura
                cla
                fc = Tabla{posicionFila,columnaFrecuencia};
                pt = Tabla{posicionFila,columnaPotencia};
                frec=conversionDecimal(fc);
                if isa(fc,'double') ==1
                    frec=fc;
                else
                    frec=conversionDecimal(fc);
                end
                if isa(pt,'double') ==1
                    pot = pt/1000;
                else
                    pot = conversionDecimal(pt)/1000;
                end

                stem(vectorFrecuencias,vectorPotencias,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                    hold on;
               h2 = stem(frec*10,pot,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','y',...
                        'Marker','o',...
                        'LineWidth',1.8);
                    hold off;
                xlabel('Frecuencia [MHz]');
                ylabel('Potencia [W]');
                grid on;
               
                contador = 1;
                datos = cell(2*columnas,1);
                for z = 1 :columnas
                    if isa(Tabla{posicionFila,z},'double') ==1
                        aux = num2str( Tabla{posicionFila,z});
                    else
                        aux = Tabla{posicionFila,z};
                    end
                    datos(contador)= strcat(Tabla(1,z),': ',aux);
                    contador=contador+2;
                end
                set(tablaConcesionarios,'string',datos());
            end 

        end
        
        
        %ONDA CORTA
        ONDACORTA = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.54 0.15 0.04],...
            'string','ONDA CORTA',...
            'Tag','ONDACORTA',...
            'backgroundcolor',[0.941 0.941 0.941]);
        
        %CALLBACK Radio Button ONDA CORTA
        set(ONDACORTA,'Callback',@CallBackONDACORTA);
        function CallBackONDACORTA(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AM,'Value',0);
            set(FM,'Value',0);
            set(TELEVISIONABIERTA,'Value',0);
            set(ONDACORTA,'Value',1);
            set(TELEVISIONCODIFICADASATELITAL,'Value',0);
            set(TELEVISIONCODIFICADATERRESTRE,'Value',0);
            set(TELEVISIONDIGITALTERRESTRE,'Value',0);
            set(TELEVISIONCABLE,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'TVABIERTA'
                    case 'ONDACORTA'
                    case 'TELEVISIONCODIFICADASATELITAL'
                    case 'TELEVISIONCODIFICADATERRESTRE'
                    case 'TELEVISIONDIGITALTERRESTRE'
                    case 'TELEVISIONCABLE'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoCategorias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Graficar Espectro y Crear Lista Consecionarios
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'Frecuencia')==1)
                    columnaFrecuencia = j;
                end
                if(strcmp( Tabla(1,j ),'Categor�a')==1)
                    columnaCategoria = j;
                end
                if(strcmp( Tabla(1,j ),'Provincia')==1)
                    columnaProvincia = j;
                end
                if(strcmp( Tabla(1,j ),'Potencia Enlace')==1)
                    columnaPotencia = j;
                end
                if(strcmp( Tabla(1,j ),'Concesionario')==1)
                    columnaConcesionarios = j;
                end
            end
            cont=0;
            concesionario= repmat({''},1,filas);
            filasConcesionario=zeros(1,filas);
            vectorFrecuencias=zeros(1,filas);
            vectorPotencias=zeros(1,filas);
            for k= 2:filas       
                frec = Tabla{k,columnaFrecuencia};
                cat = Tabla(k,columnaCategoria);
                prov= Tabla(k,columnaProvincia);
                pot= Tabla{k,columnaPotencia};
                conse= Tabla(k,columnaConcesionarios);
                if strcmp(cat,'ONDA CORTA')==1
                    if strcmp(prov,'AZUAY')==1 || strcmp(prov,'CA�AR')==1||...
                       strcmp(prov,'LOJA')==1 ||strcmp(prov,'MORONA SANTIAGO')==1||...
                       strcmp(prov,'ZAMORA CHINCHIPE')==1 ||strcmp(prov,'EL ORO')==1
                        cont = cont+1;
                        if isa(frec,'double') ==1
                            vectorFrecuencias(cont)=frec;
                        else
                            vectorFrecuencias(cont)=conversionDecimal(frec);
                        end
                        if isa(pot,'double') ==1
                            vectorPotencias(cont) = pot/1000;
                        else
                            vectorPotencias(cont) = conversionDecimal(pot)/1000;
                        end
                        
                        concesionario(cont)= conse;
                        filasConcesionario(cont)= k;
                    end
                end
            end
            concesionario = concesionario(1:cont);
            filasConcesionario = filasConcesionario(1:cont);
            vectorFrecuencias = vectorFrecuencias(1:cont);
            vectorPotencias = vectorPotencias(1:cont);
            
            %Texto ESPECTRO DE FRECUENCIAS
            espFrecuenciasONDACORTA = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.35 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA
            FigEspONDACORTA= axes('Units','pixels','Position',[350,50,600,400],'Tag','FigEspONDACORTA');
            stem(vectorFrecuencias,vectorPotencias,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [Hz]');
            ylabel('Potencia [W]');
            grid on;

            %Texto Consesionarios 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.85 0.81 0.11 0.04],...
                'string','Concesionarios:',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
             %PopMenu Consesionarios
             popMenuConcesionariosONDACORTA =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',concesionario(:),...
                'position',[ 0.81 0.76 0.2 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);         
            
            %CALLBACK Pop Menu Concesionarios
            set(popMenuConcesionariosONDACORTA,'Callback',@CallBackpopMenuConcesionariosONDACORTA);
            function CallBackpopMenuConcesionariosONDACORTA(source2,eventdata)
                %Mostrar Datos de Consesionaria
                tablaConcesionarios =  uicontrol(handles.PanelPantalla,...
                    'Tag','tboxNombres',...
                    'style','listbox',...
                    'units','normalized',...
                    'HorizontalAlignment','center',...
                    'fontsize',10,...
                    'position',[ 0.82 0.02 0.18 0.75],...
                    'backgroundcolor',[0.941 0.941 0.941]);
                
                valor= get(source2,'Value');
                
                posicionFila = filasConcesionario(valor);
                %Remarcar En la Figura
                cla
                fc = Tabla{posicionFila,columnaFrecuencia};
                pt = Tabla{posicionFila,columnaPotencia};
                frec=conversionDecimal(fc);
                if isa(fc,'double') ==1
                    frec=fc;
                else
                    frec=conversionDecimal(fc);
                end
                if isa(pt,'double') ==1
                    pot = pt/1000;
                else
                    pot = conversionDecimal(pt)/1000;
                end

                stem(vectorFrecuencias,vectorPotencias,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                    hold on;
               h2 = stem(frec,pot,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','y',...
                        'Marker','o',...
                        'LineWidth',1.8);
                    hold off;
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                grid on;
               
                contador = 1;
                datos = cell(2*columnas,1);
                for z = 1 :columnas
                    if isa(Tabla{posicionFila,z},'double') ==1
                        aux = num2str( Tabla{posicionFila,z});
                    else
                        aux = Tabla{posicionFila,z};
                    end
                    datos(contador)= strcat(Tabla(1,z),': ',aux);
                    contador=contador+2;
                end
                set(tablaConcesionarios,'string',datos());
            end 

        end
        
        
        %TELEVISION CODIFICADA SATELITAL
        TELEVISIONCODIFICADASATELITAL = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.46 0.21 0.04],...
            'string','TELEVISION CODIFICADA SATELITAL',...
            'Tag','TELEVISIONCODIFICADASATELITAL',...
            'backgroundcolor',[0.941 0.941 0.941]);

        %CALLBACK Radio Button TELEVISION CODIFICADA SATELITAL
        set(TELEVISIONCODIFICADASATELITAL,'Callback',@CallBackTELEVISIONCODIFICADASATELITAL);
        function CallBackTELEVISIONCODIFICADASATELITAL(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AM,'Value',0);
            set(FM,'Value',0);
            set(TELEVISIONABIERTA,'Value',0);
            set(ONDACORTA,'Value',0);
            set(TELEVISIONCODIFICADASATELITAL,'Value',1);
            set(TELEVISIONCODIFICADATERRESTRE,'Value',0);
            set(TELEVISIONDIGITALTERRESTRE,'Value',0);
            set(TELEVISIONCABLE,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'TVABIERTA'
                    case 'ONDACORTA'
                    case 'TELEVISIONCODIFICADASATELITAL'
                    case 'TELEVISIONCODIFICADATERRESTRE'
                    case 'TELEVISIONDIGITALTERRESTRE'
                    case 'TELEVISIONCABLE'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoCategorias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Crear Lista Consecionarios
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'Categor�a')==1)
                    columnaCategoria = j;
                end
                if(strcmp( Tabla(1,j ),'Provincia')==1)
                    columnaProvincia = j;
                end
                if(strcmp( Tabla(1,j ),'Concesionario')==1)
                    columnaConcesionarios = j;
                end
            end
            cont=0;
            concesionario= repmat({''},1,filas);
            filasConcesionario=zeros(1,filas);
            for k= 2:filas       
                prov= Tabla(k,columnaProvincia);
                cat= Tabla{k,columnaCategoria};
                conse= Tabla(k,columnaConcesionarios);
                if strcmp(cat,'TELEVISI�N CODIFICADA SATELITAL')==1
                    if strcmp(prov,'AZUAY')==1 || strcmp(prov,'CA�AR')==1||...
                       strcmp(prov,'LOJA')==1 ||strcmp(prov,'MORONA SANTIAGO')==1||...
                       strcmp(prov,'ZAMORA CHINCHIPE')==1 ||strcmp(prov,'EL ORO')==1
                        cont = cont+1;
                        concesionario(cont)= conse;
                        filasConcesionario(cont)= k;
                    end
                end
            end
            concesionario = concesionario(1:cont);
            filasConcesionario = filasConcesionario(1:cont);

            %Texto Consesionarios 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.52 0.81 0.11 0.04],...
                'string','Concesionarios:',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
             %PopMenu Consesionarios
             popMenuConcesionariosTELEVISIONCODIFICADASATELITAL =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',concesionario(:),...
                'position',[ 0.41 0.76 0.3 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);         
            
            %CALLBACK Pop Menu Concesionarios
            set(popMenuConcesionariosTELEVISIONCODIFICADASATELITAL,'Callback',@CallBackpopMenuConcesionariosTELEVISIONCODIFICADASATELITAL);
            function CallBackpopMenuConcesionariosTELEVISIONCODIFICADASATELITAL(source2,eventdata)
                %Mostrar Datos de Consesionaria
                tablaConcesionarios =  uicontrol(handles.PanelPantalla,...
                    'Tag','tboxNombres',...
                    'style','listbox',...
                    'units','normalized',...
                    'HorizontalAlignment','center',...
                    'fontsize',10,...
                    'position',[ 0.42 0.02 0.28 0.75],...
                    'backgroundcolor',[0.941 0.941 0.941]);
                
                valor= get(source2,'Value');
                
                posicionFila = filasConcesionario(valor);
                contador = 1;
                datos = cell(2*columnas,1);
                for z = 1 :columnas
                    if isa(Tabla{posicionFila,z},'double') ==1
                        aux = num2str( Tabla{posicionFila,z});
                    else
                        aux = Tabla{posicionFila,z};
                    end
                    datos(contador)= strcat(Tabla(1,z),': ',aux);
                    contador=contador+2;
                end
                set(tablaConcesionarios,'string',datos());
            end 

        end
        
        %TELEVISION CODIFICADA TERRESTRE
        TELEVISIONCODIFICADATERRESTRE = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.38 0.22 0.04],...
            'string','TELEVISION CODIFICADA TERRESTRE',...
            'Tag','TELEVISIONCODIFICADATERRESTRE',...
            'backgroundcolor',[0.941 0.941 0.941]);
        
        %CALLBACK Radio Button TELEVISION CODIFICADA TERRESSTRE
        set(TELEVISIONCODIFICADATERRESTRE,'Callback',@CallBackTELEVISIONCODIFICADATERRESTRE);
        function CallBackTELEVISIONCODIFICADATERRESTRE(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AM,'Value',0);
            set(FM,'Value',0);
            set(TELEVISIONABIERTA,'Value',0);
            set(ONDACORTA,'Value',0);
            set(TELEVISIONCODIFICADASATELITAL,'Value',0);
            set(TELEVISIONCODIFICADATERRESTRE,'Value',1);
            set(TELEVISIONDIGITALTERRESTRE,'Value',0);
            set(TELEVISIONCABLE,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'TVABIERTA'
                    case 'ONDACORTA'
                    case 'TELEVISIONCODIFICADASATELITAL'
                    case 'TELEVISIONCODIFICADATERRESTRE'
                    case 'TELEVISIONDIGITALTERRESTRE'
                    case 'TELEVISIONCABLE'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoCategorias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Crear Lista Consecionarios
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'Categor�a')==1)
                    columnaCategoria = j;
                end
                if(strcmp( Tabla(1,j ),'Provincia')==1)
                    columnaProvincia = j;
                end
                if(strcmp( Tabla(1,j ),'Concesionario')==1)
                    columnaConcesionarios = j;
                end
            end
            cont=0;
            concesionario= repmat({''},1,filas);
            filasConcesionario=zeros(1,filas);
            for k= 2:filas       
                prov= Tabla(k,columnaProvincia);
                cat= Tabla{k,columnaCategoria};
                conse= Tabla(k,columnaConcesionarios);
                if strcmp(cat,'TELEVISI�N CODIFICADA TERRESTRE')==1
                    if strcmp(prov,'AZUAY')==1 || strcmp(prov,'CA�AR')==1||...
                       strcmp(prov,'LOJA')==1 ||strcmp(prov,'MORONA SANTIAGO')==1||...
                       strcmp(prov,'ZAMORA CHINCHIPE')==1 ||strcmp(prov,'EL ORO')==1
                        cont = cont+1;
                        concesionario(cont)= conse;
                        filasConcesionario(cont)= k;
                    end
                end
            end
            concesionario = concesionario(1:cont);
            filasConcesionario = filasConcesionario(1:cont);

            %Texto Consesionarios 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.52 0.81 0.11 0.04],...
                'string','Concesionarios:',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
             %PopMenu Consesionarios
             popMenuConcesionariosTELEVISIONCODIFICADATERRESTRE =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',concesionario(:),...
                'position',[ 0.41 0.76 0.3 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);         
            
            %CALLBACK Pop Menu Concesionarios
            set(popMenuConcesionariosTELEVISIONCODIFICADATERRESTRE,'Callback',@CallBackpopMenuConcesionariosTELEVISIONCODIFICADATERRESTRE);
            function CallBackpopMenuConcesionariosTELEVISIONCODIFICADATERRESTRE(source2,eventdata)
                %Mostrar Datos de Consesionaria
                tablaConcesionarios =  uicontrol(handles.PanelPantalla,...
                    'Tag','tboxNombres',...
                    'style','listbox',...
                    'units','normalized',...
                    'HorizontalAlignment','center',...
                    'fontsize',10,...
                    'position',[ 0.42 0.02 0.28 0.75],...
                    'backgroundcolor',[0.941 0.941 0.941]);
                
                valor= get(source2,'Value');
                
                posicionFila = filasConcesionario(valor);
                contador = 1;
                datos = cell(2*columnas,1);
                for z = 1 :columnas
                    if isa(Tabla{posicionFila,z},'double') ==1
                        aux = num2str( Tabla{posicionFila,z});
                    else
                        aux = Tabla{posicionFila,z};
                    end
                    datos(contador)= strcat(Tabla(1,z),': ',aux);
                    contador=contador+2;
                end
                set(tablaConcesionarios,'string',datos());
            end 

        end
        
        %TELEVISION DIGITAL TERRESTRE
        TELEVISIONDIGITALTERRESTRE = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.3 0.2 0.04],...
            'string','TELEVISION DIGITAL TERRESTRE',...
            'Tag','TELEVISIONDIGITALTERRESTRE',...
            'backgroundcolor',[0.941 0.941 0.941]);
        
        %CALLBACK Radio Button TELEVISION DIGITAL TERRESTRE
        set(TELEVISIONDIGITALTERRESTRE,'Callback',@CallBackTELEVISIONDIGITALTERRESTRE);
        function CallBackTELEVISIONDIGITALTERRESTRE(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AM,'Value',0);
            set(FM,'Value',0);
            set(TELEVISIONABIERTA,'Value',0);
            set(ONDACORTA,'Value',0);
            set(TELEVISIONCODIFICADASATELITAL,'Value',0);
            set(TELEVISIONCODIFICADATERRESTRE,'Value',0);
            set(TELEVISIONDIGITALTERRESTRE,'Value',1);
            set(TELEVISIONCABLE,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'TVABIERTA'
                    case 'ONDACORTA'
                    case 'TELEVISIONCODIFICADASATELITAL'
                    case 'TELEVISIONCODIFICADATERRESTRE'
                    case 'TELEVISIONDIGITALTERRESTRE'
                    case 'TELEVISIONCABLE'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoCategorias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Crear Lista Consecionarios
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'Categor�a')==1)
                    columnaCategoria = j;
                end
                if(strcmp( Tabla(1,j ),'Provincia')==1)
                    columnaProvincia = j;
                end
                if(strcmp( Tabla(1,j ),'Concesionario')==1)
                    columnaConcesionarios = j;
                end
            end
            cont=0;
            concesionario= repmat({''},1,filas);
            filasConcesionario=zeros(1,filas);
            for k= 2:filas       
                prov= Tabla(k,columnaProvincia);
                cat= Tabla{k,columnaCategoria};
                conse= Tabla(k,columnaConcesionarios);
                if strcmp(cat,'TELEVISION DIGITAL TERRESTRE')==1
                    if strcmp(prov,'AZUAY')==1 || strcmp(prov,'CA�AR')==1||...
                       strcmp(prov,'LOJA')==1 ||strcmp(prov,'MORONA SANTIAGO')==1||...
                       strcmp(prov,'ZAMORA CHINCHIPE')==1 ||strcmp(prov,'EL ORO')==1
                        cont = cont+1;
                        concesionario(cont)= conse;
                        filasConcesionario(cont)= k;
                    end
                end
            end
            concesionario = concesionario(1:cont);
            filasConcesionario = filasConcesionario(1:cont);

            %Texto Consesionarios 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.52 0.81 0.11 0.04],...
                'string','Concesionarios:',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
             %PopMenu Consesionarios
             popMenuConcesionariosTELEVISIONDIGITALTERRESTRE =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',concesionario(:),...
                'position',[ 0.41 0.76 0.3 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);         
            
            %CALLBACK Pop Menu Concesionarios
            set(popMenuConcesionariosTELEVISIONDIGITALTERRESTRE,'Callback',@CallBackpopMenuConcesionariosTELEVISIONDIGITALTERRESTRE);
            function CallBackpopMenuConcesionariosTELEVISIONDIGITALTERRESTRE(source2,eventdata)
                %Mostrar Datos de Consesionaria
                tablaConcesionarios =  uicontrol(handles.PanelPantalla,...
                    'Tag','tboxNombres',...
                    'style','listbox',...
                    'units','normalized',...
                    'HorizontalAlignment','center',...
                    'fontsize',10,...
                    'position',[ 0.42 0.02 0.28 0.75],...
                    'backgroundcolor',[0.941 0.941 0.941]);
                
                valor= get(source2,'Value');
                
                posicionFila = filasConcesionario(valor);
                contador = 1;
                datos = cell(2*columnas,1);
                for z = 1 :columnas
                    if isa(Tabla{posicionFila,z},'double') ==1
                        aux = num2str( Tabla{posicionFila,z});
                    else
                        aux = Tabla{posicionFila,z};
                    end
                    datos(contador)= strcat(Tabla(1,z),': ',aux);
                    contador=contador+2;
                end
                set(tablaConcesionarios,'string',datos());
            end 

        end
        
        %TELEVISION POR CABLE
        TELEVISIONCABLE = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.22 0.2 0.04],...
            'string','TELEVISION POR CABLE',...
            'Tag','TELEVISIONCABLE',...
            'backgroundcolor',[0.941 0.941 0.941]);
        
        %CALLBACK Radio Button TELEVISION POR CABLE
        set(TELEVISIONCABLE,'Callback',@CallBackTELEVISIONCABLE);
        function CallBackTELEVISIONCABLE(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AM,'Value',0);
            set(FM,'Value',0);
            set(TELEVISIONABIERTA,'Value',0);
            set(ONDACORTA,'Value',0);
            set(TELEVISIONCODIFICADASATELITAL,'Value',0);
            set(TELEVISIONCODIFICADATERRESTRE,'Value',0);
            set(TELEVISIONDIGITALTERRESTRE,'Value',0);
            set(TELEVISIONCABLE,'Value',1);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'TVABIERTA'
                    case 'ONDACORTA'
                    case 'TELEVISIONCODIFICADASATELITAL'
                    case 'TELEVISIONCODIFICADATERRESTRE'
                    case 'TELEVISIONDIGITALTERRESTRE'
                    case 'TELEVISIONCABLE'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoCategorias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Crear Lista Consecionarios
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'Categor�a')==1)
                    columnaCategoria = j;
                end
                if(strcmp( Tabla(1,j ),'Provincia')==1)
                    columnaProvincia = j;
                end
                if(strcmp( Tabla(1,j ),'Concesionario')==1)
                    columnaConcesionarios = j;
                end
            end
            cont=0;
            concesionario= repmat({''},1,filas);
            filasConcesionario=zeros(1,filas);
            for k= 2:filas       
                prov= Tabla(k,columnaProvincia);
                cat= Tabla{k,columnaCategoria};
                conse= Tabla(k,columnaConcesionarios);
                if strcmp(cat,'TELEVISI�N POR CABLE')==1
                    if strcmp(prov,'AZUAY')==1 || strcmp(prov,'CA�AR')==1||...
                       strcmp(prov,'LOJA')==1 ||strcmp(prov,'MORONA SANTIAGO')==1||...
                       strcmp(prov,'ZAMORA CHINCHIPE')==1 ||strcmp(prov,'EL ORO')==1
                        cont = cont+1;
                        concesionario(cont)= conse;
                        filasConcesionario(cont)= k;
                    end
                end
            end
            concesionario = concesionario(1:cont);
            filasConcesionario = filasConcesionario(1:cont);

            %Texto Consesionarios 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.52 0.81 0.11 0.04],...
                'string','Concesionarios:',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
             %PopMenu Consesionarios
             popMenuConcesionariosTELEVISIONCABLE =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',concesionario(:),...
                'position',[ 0.41 0.76 0.3 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);         
            
            %CALLBACK Pop Menu Concesionarios
            set(popMenuConcesionariosTELEVISIONCABLE,'Callback',@CallBackpopMenuConcesionariosTELEVISIONCABLE);
            function CallBackpopMenuConcesionariosTELEVISIONCABLE(source2,eventdata)
                %Mostrar Datos de Consesionaria
                tablaConcesionarios =  uicontrol(handles.PanelPantalla,...
                    'Tag','tboxNombres',...
                    'style','listbox',...
                    'units','normalized',...
                    'HorizontalAlignment','center',...
                    'fontsize',10,...
                    'position',[ 0.42 0.02 0.28 0.75],...
                    'backgroundcolor',[0.941 0.941 0.941]);
                
                valor= get(source2,'Value');
                
                posicionFila = filasConcesionario(valor);
                contador = 1;
                datos = cell(2*columnas,1);
                for z = 1 :columnas
                    if isa(Tabla{posicionFila,z},'double') ==1
                        aux = num2str( Tabla{posicionFila,z});
                    else
                        aux = Tabla{posicionFila,z};
                    end
                    datos(contador)= strcat(Tabla(1,z),': ',aux);
                    contador=contador+2;
                end
                set(tablaConcesionarios,'string',datos());
            end 

        end        
        
        %GRAFICA DE CADA CATEGORIA
        
        %Contar AM, FM, TELEVISION ABIERTA y ONDA CORTA
        cantidadAM=0;
        AMprovincias=zeros(6,1);
        
        cantidadFM=0;
        FMprovincias=zeros(6,1);
        
        cantidadTVABIERTA=0;
        TVABIERTAprovincias=zeros(6,1);
        
        cantidadONDACORTA=0;
        ONDACORTAprovincias=zeros(6,1);
        
        cantidadTELEVISIONCODIFICADASATELITA=0;
        TELEVISIONCODIFICADASATELITALprovincias=zeros(6,1);
        
        cantidadTELEVISIONCODIFICADATERRESTRE=0;
        TELEVISIONCODIFICADATERRESSTREprovincias=zeros(6,1);
        
        cantidadTELEVISIONDIGITALTERRESTRE=0;
        TELEVISIONDIGITALTERRESTREprovincias=zeros(6,1);
        
        cantidadTELEVISIONCABLE=0;
        TELEVISIONCABLEprovincias=zeros(6,1);
                            
        for j= 1:columnas
            if(strcmp( Tabla(1,j ),'Provincia')==1)
                columnaProvincia = j;
            end
            if(strcmp( Tabla(1,j ),'Categor�a')==1)
                columnaCategoria = j;
            end
        end
        for k= 2:filas
            prov = Tabla{k,columnaProvincia};
            cat = Tabla{k,columnaCategoria};
            switch prov
                case 'AZUAY'%1
                    switch cat
                        case 'AMPLITUD MODULADA'
                            cantidadAM=cantidadAM+1;
                            AMprovincias(1)=AMprovincias(1)+1;
                        case 'FRECUENCIA MODULADA'
                            cantidadFM=cantidadFM+1;
                            FMprovincias(1)=FMprovincias(1)+1;
                        case 'TELEVISION ABIERTA'
                            cantidadTVABIERTA=cantidadTVABIERTA+1;
                            TVABIERTAprovincias(1)=TVABIERTAprovincias(1)+1;
                        case 'ONDA CORTA'
                            cantidadONDACORTA=cantidadONDACORTA+1;
                            ONDACORTAprovincias(1)=ONDACORTAprovincias(1)+1;
                        case 'TELEVISI�N CODIFICADA SATELITAL'
                            cantidadTELEVISIONCODIFICADASATELITA=cantidadTELEVISIONCODIFICADASATELITA+1;
                            TELEVISIONCODIFICADASATELITALprovincias(1)=TELEVISIONCODIFICADASATELITALprovincias(1)+1;
                        case 'TELEVISI�N CODIFICADA TERRESTRE'
                            cantidadTELEVISIONCODIFICADATERRESTRE=cantidadTELEVISIONCODIFICADATERRESTRE+1;
                            TELEVISIONCODIFICADATERRESSTREprovincias(1)=TELEVISIONCODIFICADATERRESSTREprovincias(1)+1;
                        case 'TELEVISION DIGITAL TERRESTRE'
                            cantidadTELEVISIONDIGITALTERRESTRE=cantidadTELEVISIONDIGITALTERRESTRE+1;
                            TELEVISIONDIGITALTERRESTREprovincias(1)=TELEVISIONDIGITALTERRESTREprovincias(1)+1;
                        case 'TELEVISI�N POR CABLE'
                            cantidadTELEVISIONCABLE=cantidadTELEVISIONCABLE+1;
                            TELEVISIONCABLEprovincias(1)=TELEVISIONCABLEprovincias(1)+1;    
                    end
                case 'CA�AR'%2
                     switch cat
                        case 'AMPLITUD MODULADA'
                            cantidadAM=cantidadAM+1;
                            AMprovincias(2)=AMprovincias(2)+1;
                        case 'FRECUENCIA MODULADA'
                            cantidadFM=cantidadFM+1;
                            FMprovincias(2)=FMprovincias(2)+1;
                        case 'TELEVISION ABIERTA'
                            cantidadTVABIERTA=cantidadTVABIERTA+1;
                            TVABIERTAprovincias(2)=TVABIERTAprovincias(2)+1;
                        case 'ONDA CORTA'
                            cantidadONDACORTA=cantidadONDACORTA+1;
                            ONDACORTAprovincias(2)=ONDACORTAprovincias(2)+1;
                        case 'TELEVISI�N CODIFICADA SATELITAL'
                            cantidadTELEVISIONCODIFICADASATELITA=cantidadTELEVISIONCODIFICADASATELITA+1;
                            TELEVISIONCODIFICADASATELITALprovincias(2)=TELEVISIONCODIFICADASATELITALprovincias(2)+1;
                        case 'TELEVISI�N CODIFICADA TERRESTRE'
                            cantidadTELEVISIONCODIFICADATERRESTRE=cantidadTELEVISIONCODIFICADATERRESTRE+1;
                            TELEVISIONCODIFICADATERRESSTREprovincias(2)=TELEVISIONCODIFICADATERRESSTREprovincias(2)+1;
                        case 'TELEVISION DIGITAL TERRESTRE'
                            cantidadTELEVISIONDIGITALTERRESTRE=cantidadTELEVISIONDIGITALTERRESTRE+1;
                            TELEVISIONDIGITALTERRESTREprovincias(2)=TELEVISIONDIGITALTERRESTREprovincias(2)+1;
                        case 'TELEVISI�N POR CABLE'
                            cantidadTELEVISIONCABLE=cantidadTELEVISIONCABLE+1;
                            TELEVISIONCABLEprovincias(2)=TELEVISIONCABLEprovincias(2)+1;     
                    end
                case 'LOJA'%3
                    switch cat
                        case 'AMPLITUD MODULADA'
                            cantidadAM=cantidadAM+1;
                            AMprovincias(3)=AMprovincias(3)+1;
                        case 'FRECUENCIA MODULADA'
                            cantidadFM=cantidadFM+1;
                            FMprovincias(3)=FMprovincias(3)+1;
                        case 'TELEVISION ABIERTA'
                            cantidadTVABIERTA=cantidadTVABIERTA+1;
                            TVABIERTAprovincias(3)=TVABIERTAprovincias(3)+1;
                        case 'ONDA CORTA'
                            cantidadONDACORTA=cantidadONDACORTA+1;
                            ONDACORTAprovincias(3)=ONDACORTAprovincias(3)+1;
                        case 'TELEVISI�N CODIFICADA SATELITAL'
                            cantidadTELEVISIONCODIFICADASATELITA=cantidadTELEVISIONCODIFICADASATELITA+1;
                            TELEVISIONCODIFICADASATELITALprovincias(3)=TELEVISIONCODIFICADASATELITALprovincias(3)+1;
                        case 'TELEVISI�N CODIFICADA TERRESTRE'
                            cantidadTELEVISIONCODIFICADATERRESTRE=cantidadTELEVISIONCODIFICADATERRESTRE+1;
                            TELEVISIONCODIFICADATERRESSTREprovincias(3)=TELEVISIONCODIFICADATERRESSTREprovincias(3)+1;
                        case 'TELEVISION DIGITAL TERRESTRE'
                            cantidadTELEVISIONDIGITALTERRESTRE=cantidadTELEVISIONDIGITALTERRESTRE+1;
                            TELEVISIONDIGITALTERRESTREprovincias(3)=TELEVISIONDIGITALTERRESTREprovincias(3)+1;
                        case 'TELEVISI�N POR CABLE'
                            cantidadTELEVISIONCABLE=cantidadTELEVISIONCABLE+1;
                            TELEVISIONCABLEprovincias(3)=TELEVISIONCABLEprovincias(3)+1;    
                    end
                case 'MORONA SANTIAGO'%4
                    switch cat
                        case 'AMPLITUD MODULADA'
                            cantidadAM=cantidadAM+1;
                            AMprovincias(4)=AMprovincias(4)+1;
                        case 'FRECUENCIA MODULADA'
                            cantidadFM=cantidadFM+1;
                            FMprovincias(4)=FMprovincias(4)+1;
                        case 'TELEVISION ABIERTA'
                            cantidadTVABIERTA=cantidadTVABIERTA+1;
                            TVABIERTAprovincias(4)=TVABIERTAprovincias(4)+1;
                        case 'ONDA CORTA'
                            cantidadONDACORTA=cantidadONDACORTA+1;
                            ONDACORTAprovincias(4)=ONDACORTAprovincias(4)+1;
                        case 'TELEVISI�N CODIFICADA SATELITAL'
                            cantidadTELEVISIONCODIFICADASATELITA=cantidadTELEVISIONCODIFICADASATELITA+1;
                            TELEVISIONCODIFICADASATELITALprovincias(4)=TELEVISIONCODIFICADASATELITALprovincias(4)+1;
                        case 'TELEVISI�N CODIFICADA TERRESTRE'
                            cantidadTELEVISIONCODIFICADATERRESTRE=cantidadTELEVISIONCODIFICADATERRESTRE+1;
                            TELEVISIONCODIFICADATERRESSTREprovincias(4)=TELEVISIONCODIFICADATERRESSTREprovincias(4)+1;
                        case 'TELEVISION DIGITAL TERRESTRE'
                            cantidadTELEVISIONDIGITALTERRESTRE=cantidadTELEVISIONDIGITALTERRESTRE+1;
                            TELEVISIONDIGITALTERRESTREprovincias(4)=TELEVISIONDIGITALTERRESTREprovincias(4)+1;
                        case 'TELEVISI�N POR CABLE'
                            cantidadTELEVISIONCABLE=cantidadTELEVISIONCABLE+1;
                            TELEVISIONCABLEprovincias(4)=TELEVISIONCABLEprovincias(4)+1;    
                    end
                case 'ZAMORA CHINCHIPE'%5
                    switch cat
                        case 'AMPLITUD MODULADA'
                            cantidadAM=cantidadAM+1;
                            AMprovincias(5)=AMprovincias(5)+1;
                        case 'FRECUENCIA MODULADA'
                            cantidadFM=cantidadFM+1;
                            FMprovincias(5)=FMprovincias(5)+1;
                        case 'TELEVISION ABIERTA'
                            cantidadTVABIERTA=cantidadTVABIERTA+1;
                            TVABIERTAprovincias(5)=TVABIERTAprovincias(5)+1;
                        case 'ONDA CORTA'
                            cantidadONDACORTA=cantidadONDACORTA+1;
                            ONDACORTAprovincias(5)=ONDACORTAprovincias(5)+1;
                        case 'TELEVISI�N CODIFICADA SATELITAL'
                            cantidadTELEVISIONCODIFICADASATELITA=cantidadTELEVISIONCODIFICADASATELITA+1;
                            TELEVISIONCODIFICADASATELITALprovincias(5)=TELEVISIONCODIFICADASATELITALprovincias(5)+1;
                        case 'TELEVISI�N CODIFICADA TERRESTRE'
                            cantidadTELEVISIONCODIFICADATERRESTRE=cantidadTELEVISIONCODIFICADATERRESTRE+1;
                            TELEVISIONCODIFICADATERRESSTREprovincias(5)=TELEVISIONCODIFICADATERRESSTREprovincias(5)+1;
                        case 'TELEVISION DIGITAL TERRESTRE'
                            cantidadTELEVISIONDIGITALTERRESTRE=cantidadTELEVISIONDIGITALTERRESTRE+1;
                            TELEVISIONDIGITALTERRESTREprovincias(5)=TELEVISIONDIGITALTERRESTREprovincias(5)+1;
                        case 'TELEVISI�N POR CABLE'
                            cantidadTELEVISIONCABLE=cantidadTELEVISIONCABLE+1;
                            TELEVISIONCABLEprovincias(5)=TELEVISIONCABLEprovincias(5)+1;    
                    end    
                case 'EL ORO'%6
                    switch cat
                        case 'AMPLITUD MODULADA'
                            cantidadAM=cantidadAM+1;
                            AMprovincias(6)=AMprovincias(6)+1;
                        case 'FRECUENCIA MODULADA'
                            cantidadFM=cantidadFM+1;
                            FMprovincias(6)=FMprovincias(6)+1;
                        case 'TELEVISION ABIERTA'
                            cantidadTVABIERTA=cantidadTVABIERTA+1;
                            TVABIERTAprovincias(6)=TVABIERTAprovincias(6)+1;
                        case 'ONDA CORTA'
                            cantidadONDACORTA=cantidadONDACORTA+1;
                            ONDACORTAprovincias(6)=ONDACORTAprovincias(6)+1;
                        case 'TELEVISI�N CODIFICADA SATELITAL'
                            cantidadTELEVISIONCODIFICADASATELITA=cantidadTELEVISIONCODIFICADASATELITA+1;
                            TELEVISIONCODIFICADASATELITALprovincias(6)=TELEVISIONCODIFICADASATELITALprovincias(6)+1;
                        case 'TELEVISI�N CODIFICADA TERRESTRE'
                            cantidadTELEVISIONCODIFICADATERRESTRE=cantidadTELEVISIONCODIFICADATERRESTRE+1;
                            TELEVISIONCODIFICADATERRESSTREprovincias(6)=TELEVISIONCODIFICADATERRESSTREprovincias(6)+1;
                        case 'TELEVISION DIGITAL TERRESTRE'
                            cantidadTELEVISIONDIGITALTERRESTRE=cantidadTELEVISIONDIGITALTERRESTRE+1;
                            TELEVISIONDIGITALTERRESTREprovincias(6)=TELEVISIONDIGITALTERRESTREprovincias(6)+1;
                        case 'TELEVISI�N POR CABLE'
                            cantidadTELEVISIONCABLE=cantidadTELEVISIONCABLE+1;
                            TELEVISIONCABLEprovincias(6)=TELEVISIONCABLEprovincias(6)+1;    
                    end    
            end
        end
        
        l=cell(1,6);
        l{1}='Azuay';
        l{2}='Loja';
        l{3}='Ca�ar';
        l{4}='Morona';
        l{5}='Zamora';
        l{6}='El Oro';
        
        %Texto AM
        str = strcat('Amplitud Modulada: ',num2str(cantidadAM));
        categoriaAM = uicontrol(handles.PanelPantalla,...
            'Tag','categoriaAM',...
            'style','text',...
            'fontWeight','bold',...
            'units','normalized',...
            'HorizontalAlignment','center',...
            'fontsize',13,...
            'position',[ 0.27 0.87 0.25 0.03],...
            'string',str,...
            'backgroundcolor',[0.941 0.941 0.941]);
        %Barras AM
        FigCatAM = axes('Units','pixels',...
            'Position',[325,395,320,110],...
            'Tag','FigCatAM');
        bar(AMprovincias,...
            'EdgeColor','k',...
            'FaceColor','k',...
            'BarWidth', 0.8);
        set(FigCatAM,'xticklabel', l); 
        grid on;
        
        %Texto FM
        str = strcat('Frecuencia Modulada: ',num2str(cantidadFM));
        categoriaFM = uicontrol(handles.PanelPantalla,...
        'Tag','categoriaFM',...
        'style','text',...
        'fontWeight','bold',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',13,...
        'position',[ 0.65 0.87 0.25 0.03],...
        'string',str,...
        'backgroundcolor',[0.941 0.941 0.941]);
        %Barras AM
        FigCatFM = axes('Units','pixels',...
            'Position',[750,395,320,110],...
            'Tag','FigCatFM');
        bar(FMprovincias,...
            'EdgeColor','b',...
            'FaceColor','b',...
            'BarWidth', 0.8);
        set(FigCatFM,'xticklabel', l); 
        grid on;

        %Texto TV Abierta
        str = strcat('Television Abierta: ',num2str(cantidadTVABIERTA));
        categoriaTVABIERTA = uicontrol(handles.PanelPantalla,...
        'Tag','categoriaTVABIERTA',...
        'style','text',...
        'fontWeight','bold',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',13,...
        'position',[ 0.27 0.6 0.25 0.03],...
        'string',str,...
        'backgroundcolor',[0.941 0.941 0.941]);
        %Barras TV Abierta
        FigCatTVABIERTA = axes('Units','pixels',...
            'Position',[325,240,320,110],...
            'Tag','FigCatTVABIERTA');
        bar(TVABIERTAprovincias,...
            'EdgeColor','y',...
            'FaceColor','y',...
            'BarWidth', 0.8);
        set(FigCatTVABIERTA,'xticklabel', l); 
        grid on;
        
        %Texto Onda Corta
        str = strcat('Onda Corta: ',num2str(cantidadONDACORTA));
        categoriaONDACORTA = uicontrol(handles.PanelPantalla,...
        'Tag','categoriaONDACORTA',...
        'style','text',...
        'fontWeight','bold',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',13,...
        'position',[ 0.65 0.33 0.25 0.03],...
        'string',str,...
        'backgroundcolor',[0.941 0.941 0.941]);
        %Barras Onda Corta
        FigCatONDACORTA = axes('Units','pixels',...
            'Position',[750,80,320,110],...
            'Tag','FigCatONDACORTA');
        bar(ONDACORTAprovincias,...
            'EdgeColor','g',...
            'FaceColor','g',...
            'BarWidth', 0.8);
        set(FigCatONDACORTA,'xticklabel', l); 
        grid on;
        
        %Texto TV Codificada Satelital
        str = strcat('Television Codificada Satelital: ',num2str(cantidadTELEVISIONCODIFICADASATELITA));
        categoriaTELEVISIONCODIFICADASATELITA = uicontrol(handles.PanelPantalla,...
        'Tag','categoriaTELEVISIONCODIFICADASATELITA',...
        'style','text',...
        'fontWeight','bold',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',13,...
        'position',[ 0.27 0.035 0.25 0.03],...
        'string',str,...
        'backgroundcolor',[0.941 0.941 0.941]);
        
        %Texto TV Codificada Terrestre
        str = strcat('Television Codificada Terrestre: ',num2str(cantidadTELEVISIONCODIFICADATERRESTRE));
        categoriaTELEVISIONCODIFICADATERRESTRE = uicontrol(handles.PanelPantalla,...
        'Tag','categoriaTELEVISIONCODIFICADATERRESTRE',...
        'style','text',...
        'fontWeight','bold',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',13,...
        'position',[ 0.65 0.035 0.25 0.03],...
        'string',str,...
        'backgroundcolor',[0.941 0.941 0.941]);
        
        %Texto TV Digital Terrestre
        str = strcat('Television Digital Terrestre: ',num2str(cantidadTELEVISIONDIGITALTERRESTRE));
        categoriaTELEVISIONDIGITALTERRESTRE = uicontrol(handles.PanelPantalla,...
        'Tag','categoriaTELEVISIONDIGITALTERRESTRE',...
        'style','text',...
        'fontWeight','bold',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',13,...
        'position',[ 0.27 0.325 0.25 0.04],...
        'string',str,...
        'backgroundcolor',[0.941 0.941 0.941]);
        %Barras TV Digital Terrestre
        FigCatTELEVISIONDIGITALTERRESTRE = axes('Units','pixels',...
            'Position',[325,80,320,110],...
            'Tag','FigCatTELEVISIONDIGITALTERRESTRE');
        bar(TELEVISIONDIGITALTERRESTREprovincias,...
            'EdgeColor','r',...
            'FaceColor','r',...
            'BarWidth', 0.8);
        set(FigCatTELEVISIONDIGITALTERRESTRE,'xticklabel', l); 
        grid on;
        
        %Texto TV Cable
        str = strcat('Television Cable: ',num2str(cantidadTELEVISIONCABLE));
        categoriaTELEVISIONCABLE = uicontrol(handles.PanelPantalla,...
        'Tag','categoriaTELEVISIONCABLE',...
        'style','text',...
        'fontWeight','bold',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',13,...
        'position',[ 0.65 0.6 0.25 0.03],...
        'string',str,...
        'backgroundcolor',[0.941 0.941 0.941]);
        %Barras Onda Corta
        FigCatTELEVISIONCABLE = axes('Units','pixels',...
            'Position',[750,240,320,110],...
            'Tag','FigCatTELEVISIONCABLE');
        bar(TELEVISIONCABLEprovincias,...
            'EdgeColor','g',...
            'FaceColor','g',...
            'BarWidth', 0.8);
        set(FigCatTELEVISIONCABLE,'xticklabel', l); 
        grid on;
        
    end
    
    
    SCDMA = uicontrol(handles.PanelPantalla,...
        'style','radiobutton',...
        'units','normalized',...
        'fontsize',12,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.15 0.92 0.09 0.045],...
        'string','SCDMA 450',...
        'Tag','RB2',...
        'backgroundcolor',[0.941 0.941 0.941]);
  
    %CALLBACK Radio Button SCDMA
    set(SCDMA,'Callback',@CallBackSCDMA);
    function CallBackSCDMA(source,eventdata)
        
        %Seleccion de la Tabla SIRATV
        Tabla = TablaSCDMA450;
        [filas columnas] = size(Tabla);
        
        %Poner los demas radioButtons como deseleccionados
        set(SIRATV,'Value',0);
        set(SCDMA,'Value',1);
        set(FWA,'Value',0);
        set(ENLACES,'Value',0);
        set( VHFUHF,'Value',0);
        set(MDBA,'Value',0);
        set(AUXILIARES,'Value',0);
        
        %BORRAR TODO DE LA PANTALLA
        HandlePanelPantalla = get(handles.PanelPantalla);
        for k = 1:length(HandlePanelPantalla.Children)
            child = get(HandlePanelPantalla.Children(k));
            tag = child.Tag;            
            switch tag
                case 'RB1'
                case 'RB2'
                case 'RB3'
                case 'RB4'
                case 'RB5'
                case 'RB6'
                case 'RB7'    
                otherwise
                    delete(HandlePanelPantalla.Children(k));
            end
        end
        HandleVentana = get(handles.figure1);
        for k = 1:length(HandleVentana.Children)
            child = get(HandleVentana.Children(k));
            tag = child.Tag;            
            switch tag
                case 'Enlaces'
                case 'EstacionesBase'
                case 'PanelPantalla'
                case 'uitoolbar3'
                case 'GrupoBaseDatos'
                otherwise
                    delete(HandleVentana.Children(k));
            end
        end
        
        %Barras ANCHO BANDA
        EspFrecCDMA = axes('Units','pixels',...
            'Position',[120,40,620,400],...
            'Tag','EspFrecCDMA');
        hold on;
        y=[1 1 ];
        x_l=[479 489];
        x_u=[483.4 492.975];
        for z=1:length(y)
            patch([x_l(z) x_l(z) x_u(z) x_u(z)],[0 y(z) y(z) 0],'b');
        end
        y=[1 1];
        x_l=[452.5 462.5];
        x_u=[454.4 464.4];
        for z=1:length(y)
            patch([x_l(z) x_l(z) x_u(z) x_u(z)],[0 y(z) y(z) 0],'r');
        end
        hold off;
        xlabel('Frecuencia [MHz]');
        ylabel('Potencia [W]');
        legend('Banda Alta','      TX','Banda Baja','     RX','Location','North');
        grid on;

        %Texto ESPECTRO DE FRECUENCIAS
        espFrecuenciasCDMA = uicontrol(handles.PanelPantalla,...
            'Tag','categoriaCDMA',...
            'style','text',...
            'fontWeight','bold',...
            'units','normalized',...
            'HorizontalAlignment','center',...
            'fontsize',17,...
            'position',[ 0.2 0.81 0.35 0.05],...
            'string','ESPECTRO DE FRECUENCIAS',...
            'backgroundcolor',[0.941 0.941 0.941]);
        
        %Texto FECHAS AUTORIZACION
        espFrecuenciasCDMA = uicontrol(handles.PanelPantalla,...
            'Tag','categoriaCDMA',...
            'style','text',...
            'fontWeight','bold',...
            'units','normalized',...
            'HorizontalAlignment','center',...
            'fontsize',17,...
            'position',[ 0.65 0.81 0.35 0.05],...
            'string','FECHA AUTORIZACION',...
            'backgroundcolor',[0.941 0.941 0.941]);
        
        %Pie De Fechas Autorizacion
        PieSCDMA = axes('Units','pixels',...
            'Position',[750,100,400,400],...
            'Tag','PieSCDMA');
        %x = [16 12 4];
        %labels = {'18/01/2013','19/06/2013','08/04/2011'};
        x = [1 2 3 2 4];
        labels = {'16/01/2007','16/05/2012','08/02/2010','21/09/2010','16/01/2007'};
        pie3(x,labels);

        %Texto conclusion SCDMA
        espFrecuenciasCDMA = uicontrol(handles.PanelPantalla,...
            'Tag','categoriaCDMA',...
            'style','text',...
            'units','normalized',...
            'HorizontalAlignment','center',...
            'fontsize',14,...
            'position',[ 0.65 0.05 0.35 0.25],...
            'string','En la ciudad de Cuenca existen 12 bases de la empresa ETAPA en la banda CDMA450 destinadas a la comunicaci�n telef�nica fija-m�vil.',...
            'backgroundcolor',[0.941 0.941 0.941]);
    end


    FWA = uicontrol(handles.PanelPantalla,...
        'style','radiobutton',...
        'units','normalized',...
        'fontsize',12,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.3 0.92 0.05 0.045],...
        'string','FWA',...
        'Tag','RB3',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %CALLBACK Radio Button FWA
    set(FWA,'Callback',@CallBackFWA);
    function CallBackFWA(source,eventdata)
        %Seleccion de la Tabla SIRATV        
        Tabla = TablaFWA;
        [filas columnas] = size(Tabla);
        
        %Poner los demas radioButtons como deseleccionados
        set(SIRATV,'Value',0);
        set(SCDMA,'Value',0);
        set(FWA,'Value',1);
        set(ENLACES,'Value',0);
        set( VHFUHF,'Value',0);
        set(MDBA,'Value',0);
        set(AUXILIARES,'Value',0);
        
        %BORRAR TODO DE LA PANTALLA
        HandlePanelPantalla = get(handles.PanelPantalla);
        for k = 1:length(HandlePanelPantalla.Children)
            child = get(HandlePanelPantalla.Children(k));
            tag = child.Tag;            
            switch tag
                case 'RB1'
                case 'RB2'
                case 'RB3'
                case 'RB4'
                case 'RB5'
                case 'RB6'
                case 'RB7'    
                otherwise
                    delete(HandlePanelPantalla.Children(k));
            end
        end
        HandleVentana = get(handles.figure1);
        for k = 1:length(HandleVentana.Children)
            child = get(HandleVentana.Children(k));
            tag = child.Tag;            
            switch tag
                case 'Enlaces'
                case 'EstacionesBase'
                case 'PanelPantalla'
                case 'uitoolbar3'
                case 'GrupoBaseDatos'
                otherwise
                    delete(HandleVentana.Children(k));
            end
        end
        
        %Barras ANCHO BANDA
        EspFrecFWA = axes('Units','pixels',...
            'Position',[120,40,620,400],...
            'Tag','EspFrecFWA');
        hold on;
        y=[1];
        x_l=[3475];
        x_u=[3485.75];
        for z=1:length(y)
            patch([x_l(z) x_l(z) x_u(z) x_u(z)],[0 y(z) y(z) 0],'b');
        end
        y=[1];
        x_l=[3575];
        x_u=[3585.75];
        for z=1:length(y)
            patch([x_l(z) x_l(z) x_u(z) x_u(z)],[0 y(z) y(z) 0],'r');
        end
        hold off;
        xlabel('Frecuencia [MHz]');
        ylabel('Potencia [W]');
        legend('Transmision','Recepcion','Location','North');
        grid on;

        %Texto ESPECTRO DE FRECUENCIAS
        espFrecuenciasFWA = uicontrol(handles.PanelPantalla,...
            'Tag','categoriaCDMA',...
            'style','text',...
            'fontWeight','bold',...
            'units','normalized',...
            'HorizontalAlignment','center',...
            'fontsize',17,...
            'position',[ 0.2 0.81 0.35 0.05],...
            'string','ESPECTRO DE FRECUENCIAS',...
            'backgroundcolor',[0.941 0.941 0.941]);
        
        %Texto FECHAS AUTORIZACION
        espFrecuenciasFWA = uicontrol(handles.PanelPantalla,...
            'Tag','categoriaFWA',...
            'style','text',...
            'fontWeight','bold',...
            'units','normalized',...
            'HorizontalAlignment','center',...
            'fontsize',17,...
            'position',[ 0.65 0.81 0.35 0.05],...
            'string','FECHA AUTORIZACION',...
            'backgroundcolor',[0.941 0.941 0.941]);
        
        %Pie De Fechas Autorizacion
        PieSFWA = axes('Units','pixels',...
            'Position',[750,100,400,400],...
            'Tag','PieSFWA');
        x = [16 12 4];
        labels = {'18/01/2013','19/06/2013','08/04/2011'};
        pie3(x,labels);

        %Texto conclusion FWA
        espFrecuenciasFWA = uicontrol(handles.PanelPantalla,...
            'Tag','categoriaCDMA',...
            'style','text',...
            'units','normalized',...
            'HorizontalAlignment','center',...
            'fontsize',14,...
            'position',[ 0.65 0.05 0.35 0.25],...
            'string','Las radiobases de la empresa ETAPA de Fixed-wireless access (FWA)(Bucle Local) son 32.',...
            'backgroundcolor',[0.941 0.941 0.941]);
    end

    
    ENLACES = uicontrol(handles.PanelPantalla,...
        'style','radiobutton',...
        'units','normalized',...
        'fontsize',12,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.42 0.92 0.08 0.045],...
        'string','ENLACES',...
        'Tag','RB4',...
        'backgroundcolor',[0.941 0.941 0.941]);    

    %CALLBACK Radio Button ENLACES
    set(ENLACES,'Callback',@CallBackEnlaces);
    function CallBackEnlaces(source,eventdata)

        %Seleccion de la Tabla ENLACES
        Tabla = TablaEnlaces;
        [filas columnas] = size(Tabla);
        
        %Poner los demas radioButtons como deseleccionados
        set(SIRATV,'Value',0);
        set(SCDMA,'Value',0);
        set(FWA,'Value',0);
        set(ENLACES,'Value',1);
        set( VHFUHF,'Value',0);
        set(MDBA,'Value',0);
        set(AUXILIARES,'Value',0);
        
        %BORRAR TODO DE LA PANTALLA
        HandlePanelPantalla = get(handles.PanelPantalla);
        for k = 1:length(HandlePanelPantalla.Children)
            child = get(HandlePanelPantalla.Children(k));
            tag = child.Tag;            
            switch tag
                case 'RB1'
                case 'RB2'
                case 'RB3'
                case 'RB4'
                case 'RB5'
                case 'RB6'
                case 'RB7'    
                otherwise
                    delete(HandlePanelPantalla.Children(k));
            end
        end
        HandleVentana = get(handles.figure1);
        for k = 1:length(HandleVentana.Children)
            child = get(HandleVentana.Children(k));
            tag = child.Tag;            
            switch tag
                case 'Enlaces'
                case 'EstacionesBase'
                case 'PanelPantalla'
                case 'uitoolbar3'
                case 'GrupoBaseDatos'
                otherwise
                    delete(HandleVentana.Children(k));
            end
        end
        
        
        %RADIO BUTTONS PARA SELECCIONAR CATEGORIA
        GrupoProvincias = uibuttongroup(...
            'visible','on',...
            'fontsize',10,...
            'FontName','Times New Roman',...
            'Position',[0.025 0.4 0.15 0.4],...
            'Title','PROVINCIAS',...
            'Tag', 'GrupoProvincias',...
            'backgroundcolor',[ 0.941 0.941 0.941]);
        
        %AZUAY        
        AZUAY = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.78 0.1 0.04],...
            'string','AZUAY',...
            'Tag','AZUAY',...
            'backgroundcolor',[0.941 0.941 0.941]);        
                 
        %CALLBACK Radio Button AZUAY
        set(AZUAY,'Callback',@CallBackAZUAY);
        function CallBackAZUAY(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',1);
            set(CANAR,'Value',0);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Graficar Espectro y Crear Lista Consecionarios
            columnaPotenciaTx = 17;
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'Tx')==1)
                    columnaFrecuenciaTx = j;
                end
                if(strcmp( Tabla(1,j ),'Rx')==1)
                    columnaFrecuenciaRx = j;
                end
                if(strcmp( Tabla(1,j ),'PROVINCIA')==1)
                    columnaProvincia= j;
                end
                if(strcmp( Tabla(1,j ),'POTENCIA')==1)&&(j~=columnaPotenciaTx)
                    columnaPotenciaRx = j;
                end
                if(strcmp( Tabla(1,j ),'NOMBRES')==1)
                    columnaConcesionarios = j;
                end
            end
            cont=0;
            nombre= repmat({''},1,filas);
            filasNombres=zeros(1,filas);
            vectorFrecuenciasTx=zeros(1,filas);
            vectorFrecuenciasRx=zeros(1,filas);
            vectorPotenciasTx=zeros(1,filas);
            vectorPotenciasRx=zeros(1,filas);
            for k= 2:filas       
                frecTx = Tabla{k,columnaFrecuenciaTx};
                frecRx = Tabla{k,columnaFrecuenciaRx};
                prov= Tabla(k,columnaProvincia);
                potTx= Tabla{k,columnaPotenciaTx};
                potRx= Tabla{k,columnaPotenciaRx};
                nomb= Tabla(k,columnaConcesionarios);
                if strcmp(prov,'AZUAY')==1
                    cont = cont+1;
                    
                    if isa(frecTx,'double') ==1
                        vectorFrecuenciasTx(cont)=frecTx;
                    else
                        vectorFrecuenciasTx(cont)=conversionDecimal(frecTx);
                    end
                    
                    if isa(frecRx,'double') ==1
                        vectorFrecuenciasRx(cont)=frecRx;
                    else
                        vectorFrecuenciasRx(cont)=conversionDecimal(frecRx);
                    end
                    
                    if isa(potTx,'double') ==1
                        vectorPotenciasTx(cont) = potTx;
                    else
                        vectorPotenciasTx(cont) = conversionDecimal(potTx);
                    end
                    
                    if isa(potRx,'double') ==1
                        vectorPotenciasRx(cont) = potRx;
                    else
                        vectorPotenciasRx(cont) = conversionDecimal(potRx);
                    end
                    
                    nombre(cont)= nomb;
                    filasNombres(cont)= k;
                end
            end
            nombre = nombre(1:cont);
            filasNombres = filasNombres(1:cont);
            
            %Texto ESPECTRO DE FRECUENCIAS TX
            espFrecuenciasAZUAYTX = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.2 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS TX',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA TX
            FigEspAZUAYTX= axes('Units','pixels','Position',[250,50,420,400],'Tag','FigEspAZUAYTX');
            stem(vectorFrecuenciasTx,vectorPotenciasTx,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [Hz]');
            ylabel('Potencia [W]');
            grid on;            
            
            %Texto ESPECTRO DE FRECUENCIAS RX
            espFrecuenciasAZUAYRX = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.62 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS RX',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA RX
            FigEspAZUAYRX= axes('Units','pixels','Position',[730,50,420,400],'Tag','FigEspAZUAYRX');

            stem(vectorFrecuenciasRx,vectorPotenciasRx,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [Hz]');
            ylabel('Potencia [W]');
            grid on;

            %Texto Nombres 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.08 0.3 0.1 0.04],...
                'string','Nombres:',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
             %PopMenu Nombres
             popMenuNombresAZUAY =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',nombre(:),...
                'position',[ 0.01 0.24 0.17 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);         
            
            %CALLBACK Pop Menu Nombre
            set(popMenuNombresAZUAY,'Callback',@CallBackpopMenuNombresAZUAY);
            function CallBackpopMenuNombresAZUAY(source2,eventdata)
                
                %Remarcar las Figuras
                HandleVentana = get(handles.figure1);
                for k = 1:length(HandleVentana.Children)
                    child = get(HandleVentana.Children(k));
                    tag = child.Tag;           
                     if (strcmp( tag,'')==1)
                        delete(HandleVentana.Children(k));
                     end
                end
                
                valor= get(source2,'Value');
                posicionFila = filasNombres(valor);
                
                fcTx = Tabla{posicionFila,columnaFrecuenciaTx};
                ptTx = Tabla{posicionFila,columnaPotenciaTx};
                fcRx = Tabla{posicionFila,columnaFrecuenciaRx};
                ptRx = Tabla{posicionFila,columnaPotenciaRx};
                
                if isa(fcTx,'double') ==1
                    frecTx=fcTx;
                else
                    frecTx=conversionDecimal(fcTx);
                end

                if isa(fcRx,'double') ==1
                    frecRx=fcRx;
                else
                    frecRx=conversionDecimal(fcRx);
                end

                if isa(ptTx,'double') ==1
                    potTx=ptTx;
                else
                    potTx = conversionDecimal(ptTx);
                end

                if isa(ptRx,'double') ==1
                    potRx=ptRx;
                else
                    potRx = conversionDecimal(ptRx);
                end

                %Figura ESPECTRO FRECUENCIA TX
                FigEspAZUAYTX= axes('Units','pixels','Position',[250,50,420,400],'Tag','FigEspAZUAYTX');
                stem(vectorFrecuenciasTx,vectorPotenciasTx,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2 = stem(frecTx,potTx,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','y',...
                        'Marker','o',...
                        'LineWidth',1.8);
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                hold off;
                grid on;       
            
            
            
                %Figura ESPECTRO FRECUENCIA RX
                FigEspAZUAYRX= axes('Units','pixels','Position',[730,50,420,400],'Tag','FigEspAZUAYRX');

                stem(vectorFrecuenciasRx,vectorPotenciasRx,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2 = stem(frecRx,potRx,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','y',...
                        'Marker','o',...
                        'LineWidth',1.8);
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                hold off;
                grid on;
                
                
            end 

        end
        
        %CA�AR
        CANAR = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.7 0.1 0.04],...
            'string','CA�AR',...
            'Tag','CANAR',...
            'backgroundcolor',[0.941 0.941 0.941]);

        %CALLBACK Radio Button CANAR
        set(CANAR,'Callback',@CallBackCANAR);
        function CallBackCANAR(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',1);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Graficar Espectro y Crear Lista Consecionarios
            columnaPotenciaTx = 17;
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'Tx')==1)
                    columnaFrecuenciaTx = j;
                end
                if(strcmp( Tabla(1,j ),'Rx')==1)
                    columnaFrecuenciaRx = j;
                end
                if(strcmp( Tabla(1,j ),'PROVINCIA')==1)
                    columnaProvincia= j;
                end
                if(strcmp( Tabla(1,j ),'POTENCIA')==1)&&(j~=columnaPotenciaTx)
                    columnaPotenciaRx = j;
                end
                if(strcmp( Tabla(1,j ),'NOMBRES')==1)
                    columnaConcesionarios = j;
                end
            end
            cont=0;
            nombre= repmat({''},1,filas);
            filasNombres=zeros(1,filas);
            vectorFrecuenciasTx=zeros(1,filas);
            vectorFrecuenciasRx=zeros(1,filas);
            vectorPotenciasTx=zeros(1,filas);
            vectorPotenciasRx=zeros(1,filas);
            for k= 2:filas       
                frecTx = Tabla{k,columnaFrecuenciaTx};
                frecRx = Tabla{k,columnaFrecuenciaRx};
                prov= Tabla(k,columnaProvincia);
                potTx= Tabla{k,columnaPotenciaTx};
                potRx= Tabla{k,columnaPotenciaRx};
                nomb= Tabla(k,columnaConcesionarios);
                if strcmp(prov,'CA�AR')==1
                    cont = cont+1;
                    
                    if isa(frecTx,'double') ==1
                        vectorFrecuenciasTx(cont)=frecTx;
                    else
                        vectorFrecuenciasTx(cont)=conversionDecimal(frecTx);
                    end
                    
                    if isa(frecRx,'double') ==1
                        vectorFrecuenciasRx(cont)=frecRx;
                    else
                        vectorFrecuenciasRx(cont)=conversionDecimal(frecRx);
                    end
                    
                    if isa(potTx,'double') ==1
                        vectorPotenciasTx(cont) = potTx;
                    else
                        vectorPotenciasTx(cont) = conversionDecimal(potTx);
                    end
                    
                    if isa(potRx,'double') ==1
                        vectorPotenciasRx(cont) = potRx;
                    else
                        vectorPotenciasRx(cont) = conversionDecimal(potRx);
                    end
                    
                    nombre(cont)= nomb;
                    filasNombres(cont)= k;
                end
            end
            nombre = nombre(1:cont);
            filasNombres = filasNombres(1:cont);
            
            %Texto ESPECTRO DE FRECUENCIAS TX
            espFrecuenciasCANARTX = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.2 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS TX',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA TX
            FigEspCANARTX= axes('Units','pixels','Position',[250,50,420,400],'Tag','');
            stem(vectorFrecuenciasTx,vectorPotenciasTx,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [Hz]');
            ylabel('Potencia [W]');
            grid on;            
            
            %Texto ESPECTRO DE FRECUENCIAS RX
            espFrecuenciasCANARRX = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.62 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS RX',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA RX
            FigEspCANARRX= axes('Units','pixels','Position',[730,50,420,400],'Tag','');

            stem(vectorFrecuenciasRx,vectorPotenciasRx,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [Hz]');
            ylabel('Potencia [W]');
            grid on;

            %Texto Nombres 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.08 0.3 0.1 0.04],...
                'string','Nombres:',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
             %PopMenu Nombres
             popMenuNombresCANAR =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',nombre(:),...
                'position',[ 0.01 0.24 0.17 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);         
            
            %CALLBACK Pop Menu Nombre
            set(popMenuNombresCANAR,'Callback',@CallBackpopMenuNombresCANAR);
            function CallBackpopMenuNombresCANAR(source2,eventdata)
                
                %Remarcar las Figuras
                HandleVentana = get(handles.figure1);
                for k = 1:length(HandleVentana.Children)
                    child = get(HandleVentana.Children(k));
                    tag = child.Tag;           
                     if (strcmp( tag,'')==1)
                        delete(HandleVentana.Children(k));
                     end
                end
                
                valor= get(source2,'Value');
                posicionFila = filasNombres(valor);
                
                fcTx = Tabla{posicionFila,columnaFrecuenciaTx};
                ptTx = Tabla{posicionFila,columnaPotenciaTx};
                fcRx = Tabla{posicionFila,columnaFrecuenciaRx};
                ptRx = Tabla{posicionFila,columnaPotenciaRx};
                
                if isa(fcTx,'double') ==1
                    frecTx=fcTx;
                else
                    frecTx=conversionDecimal(fcTx);
                end

                if isa(fcRx,'double') ==1
                    frecRx=fcRx;
                else
                    frecRx=conversionDecimal(fcRx);
                end

                if isa(ptTx,'double') ==1
                    potTx=ptTx;
                else
                    potTx = conversionDecimal(ptTx);
                end

                if isa(ptRx,'double') ==1
                    potRx=ptRx;
                else
                    potRx = conversionDecimal(ptRx);
                end

                %Figura ESPECTRO FRECUENCIA TX
                FigEspCANARTX= axes('Units','pixels','Position',[250,50,420,400],'Tag','');
                stem(vectorFrecuenciasTx,vectorPotenciasTx,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2 = stem(frecTx,potTx,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','y',...
                        'Marker','o',...
                        'LineWidth',1.8);
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                hold off;
                grid on;       
            
            
            
                %Figura ESPECTRO FRECUENCIA RX
                FigEspCANARRX= axes('Units','pixels','Position',[730,50,420,400],'Tag','');

                stem(vectorFrecuenciasRx,vectorPotenciasRx,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2 = stem(frecRx,potRx,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','y',...
                        'Marker','o',...
                        'LineWidth',1.8);
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                hold off;
                grid on;
                
                
            end 

        end
        

        %LOJA
        LOJA = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.62 0.1 0.04],...
            'string','LOJA',...
            'Tag','LOJA',...
            'backgroundcolor',[0.941 0.941 0.941]);        
       
        %CALLBACK Radio Button LOJA
        set(LOJA,'Callback',@CallBackLOJA);
        function CallBackLOJA(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',0);
            set(LOJA,'Value',1);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Graficar Espectro y Crear Lista Consecionarios
            columnaPotenciaTx = 17;
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'Tx')==1)
                    columnaFrecuenciaTx = j;
                end
                if(strcmp( Tabla(1,j ),'Rx')==1)
                    columnaFrecuenciaRx = j;
                end
                if(strcmp( Tabla(1,j ),'PROVINCIA')==1)
                    columnaProvincia= j;
                end
                if(strcmp( Tabla(1,j ),'POTENCIA')==1)&&(j~=columnaPotenciaTx)
                    columnaPotenciaRx = j;
                end
                if(strcmp( Tabla(1,j ),'NOMBRES')==1)
                    columnaConcesionarios = j;
                end
            end
            cont=0;
            nombre= repmat({''},1,filas);
            filasNombres=zeros(1,filas);
            vectorFrecuenciasTx=zeros(1,filas);
            vectorFrecuenciasRx=zeros(1,filas);
            vectorPotenciasTx=zeros(1,filas);
            vectorPotenciasRx=zeros(1,filas);
            for k= 2:filas       
                frecTx = Tabla{k,columnaFrecuenciaTx};
                frecRx = Tabla{k,columnaFrecuenciaRx};
                prov= Tabla(k,columnaProvincia);
                potTx= Tabla{k,columnaPotenciaTx};
                potRx= Tabla{k,columnaPotenciaRx};
                nomb= Tabla(k,columnaConcesionarios);
                if strcmp(prov,'LOJA')==1
                    cont = cont+1;
                    
                    if isa(frecTx,'double') ==1
                        vectorFrecuenciasTx(cont)=frecTx;
                    else
                        vectorFrecuenciasTx(cont)=conversionDecimal(frecTx);
                    end
                    
                    if isa(frecRx,'double') ==1
                        vectorFrecuenciasRx(cont)=frecRx;
                    else
                        vectorFrecuenciasRx(cont)=conversionDecimal(frecRx);
                    end
                    
                    if isa(potTx,'double') ==1
                        vectorPotenciasTx(cont) = potTx;
                    else
                        vectorPotenciasTx(cont) = conversionDecimal(potTx);
                    end
                    
                    if isa(potRx,'double') ==1
                        vectorPotenciasRx(cont) = potRx;
                    else
                        vectorPotenciasRx(cont) = conversionDecimal(potRx);
                    end
                    
                    nombre(cont)= nomb;
                    filasNombres(cont)= k;
                end
            end
            nombre = nombre(1:cont);
            filasNombres = filasNombres(1:cont);
            
            %Texto ESPECTRO DE FRECUENCIAS TX
            espFrecuenciasLOJATX = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.2 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS TX',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA TX
            FigEspLOJATX= axes('Units','pixels','Position',[250,50,420,400],'Tag','');
            stem(vectorFrecuenciasTx,vectorPotenciasTx,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [Hz]');
            ylabel('Potencia [W]');
            grid on;            
            
            %Texto ESPECTRO DE FRECUENCIAS RX
            espFrecuenciasLOJARX = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.62 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS RX',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA RX
            FigEspLOJARX= axes('Units','pixels','Position',[730,50,420,400],'Tag','');

            stem(vectorFrecuenciasRx,vectorPotenciasRx,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [Hz]');
            ylabel('Potencia [W]');
            grid on;

            %Texto Nombres 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.08 0.3 0.1 0.04],...
                'string','Nombres:',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
             %PopMenu Nombres
             popMenuNombresLOJA =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',nombre(:),...
                'position',[ 0.01 0.24 0.17 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);         
            
            %CALLBACK Pop Menu Nombre
            set(popMenuNombresLOJA,'Callback',@CallBackpopMenuNombresLOJA);
            function CallBackpopMenuNombresLOJA(source2,eventdata)
                
                %Remarcar las Figuras
                HandleVentana = get(handles.figure1);
                for k = 1:length(HandleVentana.Children)
                    child = get(HandleVentana.Children(k));
                    tag = child.Tag;           
                     if (strcmp( tag,'')==1)
                        delete(HandleVentana.Children(k));
                     end
                end
                
                valor= get(source2,'Value');
                posicionFila = filasNombres(valor);
                
                fcTx = Tabla{posicionFila,columnaFrecuenciaTx};
                ptTx = Tabla{posicionFila,columnaPotenciaTx};
                fcRx = Tabla{posicionFila,columnaFrecuenciaRx};
                ptRx = Tabla{posicionFila,columnaPotenciaRx};
                
                if isa(fcTx,'double') ==1
                    frecTx=fcTx;
                else
                    frecTx=conversionDecimal(fcTx);
                end

                if isa(fcRx,'double') ==1
                    frecRx=fcRx;
                else
                    frecRx=conversionDecimal(fcRx);
                end

                if isa(ptTx,'double') ==1
                    potTx=ptTx;
                else
                    potTx = conversionDecimal(ptTx);
                end

                if isa(ptRx,'double') ==1
                    potRx=ptRx;
                else
                    potRx = conversionDecimal(ptRx);
                end

                %Figura ESPECTRO FRECUENCIA TX
                FigEspLOJATX= axes('Units','pixels','Position',[250,50,420,400],'Tag','');
                stem(vectorFrecuenciasTx,vectorPotenciasTx,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2 = stem(frecTx,potTx,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','y',...
                        'Marker','o',...
                        'LineWidth',1.8);
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                hold off;
                grid on;       
            
            
            
                %Figura ESPECTRO FRECUENCIA RX
                FigEspLOJARX= axes('Units','pixels','Position',[730,50,420,400],'Tag','');

                stem(vectorFrecuenciasRx,vectorPotenciasRx,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2 = stem(frecRx,potRx,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','y',...
                        'Marker','o',...
                        'LineWidth',1.8);
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                hold off;
                grid on;
                
                
            end 

        end
        
             
        
        %ZAMORA CHINCHIPE
        ZAMORACHINCHIPE = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.54 0.12 0.04],...
            'string','ZAMORA CHINCHIPE',...
            'Tag','ZAMORACHINCHIPE',...
            'backgroundcolor',[0.941 0.941 0.941]);
        
        %CALLBACK Radio Button ZAMORA CHINCHIPE
        set(ZAMORACHINCHIPE,'Callback',@CallBackZAMORACHINCHIPE);
        function CallBackZAMORACHINCHIPE(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',0);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',1);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Graficar Espectro y Crear Lista Consecionarios
            columnaPotenciaTx = 17;
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'Tx')==1)
                    columnaFrecuenciaTx = j;
                end
                if(strcmp( Tabla(1,j ),'Rx')==1)
                    columnaFrecuenciaRx = j;
                end
                if(strcmp( Tabla(1,j ),'PROVINCIA')==1)
                    columnaProvincia= j;
                end
                if(strcmp( Tabla(1,j ),'POTENCIA')==1)&&(j~=columnaPotenciaTx)
                    columnaPotenciaRx = j;
                end
                if(strcmp( Tabla(1,j ),'NOMBRES')==1)
                    columnaConcesionarios = j;
                end
            end
            cont=0;
            nombre= repmat({''},1,filas);
            filasNombres=zeros(1,filas);
            vectorFrecuenciasTx=zeros(1,filas);
            vectorFrecuenciasRx=zeros(1,filas);
            vectorPotenciasTx=zeros(1,filas);
            vectorPotenciasRx=zeros(1,filas);
            for k= 2:filas       
                frecTx = Tabla{k,columnaFrecuenciaTx};
                frecRx = Tabla{k,columnaFrecuenciaRx};
                prov= Tabla(k,columnaProvincia);
                potTx= Tabla{k,columnaPotenciaTx};
                potRx= Tabla{k,columnaPotenciaRx};
                nomb= Tabla(k,columnaConcesionarios);
                if strcmp(prov,'ZAMORA CHINCHIPE')==1
                    cont = cont+1;
                    
                    if isa(frecTx,'double') ==1
                        vectorFrecuenciasTx(cont)=frecTx;
                    else
                        vectorFrecuenciasTx(cont)=conversionDecimal(frecTx);
                    end
                    
                    if isa(frecRx,'double') ==1
                        vectorFrecuenciasRx(cont)=frecRx;
                    else
                        vectorFrecuenciasRx(cont)=conversionDecimal(frecRx);
                    end
                    
                    if isa(potTx,'double') ==1
                        vectorPotenciasTx(cont) = potTx;
                    else
                        vectorPotenciasTx(cont) = conversionDecimal(potTx);
                    end
                    
                    if isa(potRx,'double') ==1
                        vectorPotenciasRx(cont) = potRx;
                    else
                        vectorPotenciasRx(cont) = conversionDecimal(potRx);
                    end
                    
                    nombre(cont)= nomb;
                    filasNombres(cont)= k;
                end
            end
            nombre = nombre(1:cont);
            filasNombres = filasNombres(1:cont);
            
            %Texto ESPECTRO DE FRECUENCIAS TX
            espFrecuenciasZAMORACHINCHIPETX = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.2 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS TX',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA TX
            FigEspZAMORACHINCHIPETX= axes('Units','pixels','Position',[250,50,420,400],'Tag','');
            stem(vectorFrecuenciasTx,vectorPotenciasTx,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [Hz]');
            ylabel('Potencia [W]');
            grid on;            
            
            %Texto ESPECTRO DE FRECUENCIAS RX
            espFrecuenciasZAMORACHINCHIPERX = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.62 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS RX',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA RX
            FigEspZAMORACHINCHIPERX= axes('Units','pixels','Position',[730,50,420,400],'Tag','');

            stem(vectorFrecuenciasRx,vectorPotenciasRx,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [Hz]');
            ylabel('Potencia [W]');
            grid on;

            %Texto Nombres 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.08 0.3 0.1 0.04],...
                'string','Nombres:',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
             %PopMenu Nombres
             popMenuNombresZAMORACHINCHIPE =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',nombre(:),...
                'position',[ 0.01 0.24 0.17 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);         
            
            %CALLBACK Pop Menu Nombre
            set(popMenuNombresZAMORACHINCHIPE,'Callback',@CallBackpopMenuNombresZAMORACHINCHIPE);
            function CallBackpopMenuNombresZAMORACHINCHIPE(source2,eventdata)
                
                %Remarcar las Figuras
                HandleVentana = get(handles.figure1);
                for k = 1:length(HandleVentana.Children)
                    child = get(HandleVentana.Children(k));
                    tag = child.Tag;           
                     if (strcmp( tag,'')==1)
                        delete(HandleVentana.Children(k));
                     end
                end
                
                valor= get(source2,'Value');
                posicionFila = filasNombres(valor);
                
                fcTx = Tabla{posicionFila,columnaFrecuenciaTx};
                ptTx = Tabla{posicionFila,columnaPotenciaTx};
                fcRx = Tabla{posicionFila,columnaFrecuenciaRx};
                ptRx = Tabla{posicionFila,columnaPotenciaRx};
                
                if isa(fcTx,'double') ==1
                    frecTx=fcTx;
                else
                    frecTx=conversionDecimal(fcTx);
                end

                if isa(fcRx,'double') ==1
                    frecRx=fcRx;
                else
                    frecRx=conversionDecimal(fcRx);
                end

                if isa(ptTx,'double') ==1
                    potTx=ptTx;
                else
                    potTx = conversionDecimal(ptTx);
                end

                if isa(ptRx,'double') ==1
                    potRx=ptRx;
                else
                    potRx = conversionDecimal(ptRx);
                end

                %Figura ESPECTRO FRECUENCIA TX
                FigEspZAMORACHINCHIPETX= axes('Units','pixels','Position',[250,50,420,400],'Tag','');
                stem(vectorFrecuenciasTx,vectorPotenciasTx,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2 = stem(frecTx,potTx,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','y',...
                        'Marker','o',...
                        'LineWidth',1.8);
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                hold off;
                grid on;       
            
            
            
                %Figura ESPECTRO FRECUENCIA RX
                FigEspZAMORACHINCHIPERX= axes('Units','pixels','Position',[730,50,420,400],'Tag','');

                stem(vectorFrecuenciasRx,vectorPotenciasRx,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2 = stem(frecRx,potRx,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','y',...
                        'Marker','o',...
                        'LineWidth',1.8);
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                hold off;
                grid on;
                
                
            end 

        end
        
        %MORONA SANTIAGO
        MORONASANTIAGO = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.46 0.13 0.04],...
            'string','MORONA SANTIAGO',...
            'Tag','MORONASANTIAGO',...
            'backgroundcolor',[0.941 0.941 0.941]);

        %CALLBACK Radio Button MORONA SANTIAGO
        set(MORONASANTIAGO,'Callback',@CallBackMORONASANTIAGO);
        function CallBackMORONASANTIAGO(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',0);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',1);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Graficar Espectro y Crear Lista Consecionarios
            columnaPotenciaTx = 17;
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'Tx')==1)
                    columnaFrecuenciaTx = j;
                end
                if(strcmp( Tabla(1,j ),'Rx')==1)
                    columnaFrecuenciaRx = j;
                end
                if(strcmp( Tabla(1,j ),'PROVINCIA')==1)
                    columnaProvincia= j;
                end
                if(strcmp( Tabla(1,j ),'POTENCIA')==1)&&(j~=columnaPotenciaTx)
                    columnaPotenciaRx = j;
                end
                if(strcmp( Tabla(1,j ),'NOMBRES')==1)
                    columnaConcesionarios = j;
                end
            end
            cont=0;
            nombre= repmat({''},1,filas);
            filasNombres=zeros(1,filas);
            vectorFrecuenciasTx=zeros(1,filas);
            vectorFrecuenciasRx=zeros(1,filas);
            vectorPotenciasTx=zeros(1,filas);
            vectorPotenciasRx=zeros(1,filas);
            for k= 2:filas       
                frecTx = Tabla{k,columnaFrecuenciaTx};
                frecRx = Tabla{k,columnaFrecuenciaRx};
                prov= Tabla(k,columnaProvincia);
                potTx= Tabla{k,columnaPotenciaTx};
                potRx= Tabla{k,columnaPotenciaRx};
                nomb= Tabla(k,columnaConcesionarios);
                if strcmp(prov,'MORONA SANTIAGO')==1
                    cont = cont+1;
                    
                    if isa(frecTx,'double') ==1
                        vectorFrecuenciasTx(cont)=frecTx;
                    else
                        vectorFrecuenciasTx(cont)=conversionDecimal(frecTx);
                    end
                    
                    if isa(frecRx,'double') ==1
                        vectorFrecuenciasRx(cont)=frecRx;
                    else
                        vectorFrecuenciasRx(cont)=conversionDecimal(frecRx);
                    end
                    
                    if isa(potTx,'double') ==1
                        vectorPotenciasTx(cont) = potTx;
                    else
                        vectorPotenciasTx(cont) = conversionDecimal(potTx);
                    end
                    
                    if isa(potRx,'double') ==1
                        vectorPotenciasRx(cont) = potRx;
                    else
                        vectorPotenciasRx(cont) = conversionDecimal(potRx);
                    end
                    
                    nombre(cont)= nomb;
                    filasNombres(cont)= k;
                end
            end
            nombre = nombre(1:cont);
            filasNombres = filasNombres(1:cont);
            
            %Texto ESPECTRO DE FRECUENCIAS TX
            espFrecuenciasMORONASANTIAGOTX = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.2 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS TX',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA TX
            FigEspMORONASANTIAGOTX= axes('Units','pixels','Position',[250,50,420,400],'Tag','');
            stem(vectorFrecuenciasTx,vectorPotenciasTx,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [Hz]');
            ylabel('Potencia [W]');
            grid on;            
            
            %Texto ESPECTRO DE FRECUENCIAS RX
            espFrecuenciasMORONASANTIAGORX = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.62 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS RX',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA RX
            FigEspZAMORONASANTIAGORX= axes('Units','pixels','Position',[730,50,420,400],'Tag','');

            stem(vectorFrecuenciasRx,vectorPotenciasRx,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [Hz]');
            ylabel('Potencia [W]');
            grid on;

            %Texto Nombres 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.08 0.3 0.1 0.04],...
                'string','Nombres:',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
             %PopMenu Nombres
             popMenuNombresMORONASANTIAGO =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',nombre(:),...
                'position',[ 0.01 0.24 0.17 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);         
            
            %CALLBACK Pop Menu Nombre
            set(popMenuNombresMORONASANTIAGO,'Callback',@CallBackpopMenuNombresMORONASANTIAGO);
            function CallBackpopMenuNombresMORONASANTIAGO(source2,eventdata)
                
                %Remarcar las Figuras
                HandleVentana = get(handles.figure1);
                for k = 1:length(HandleVentana.Children)
                    child = get(HandleVentana.Children(k));
                    tag = child.Tag;           
                     if (strcmp( tag,'')==1)
                        delete(HandleVentana.Children(k));
                     end
                end
                
                valor= get(source2,'Value');
                posicionFila = filasNombres(valor);
                
                fcTx = Tabla{posicionFila,columnaFrecuenciaTx};
                ptTx = Tabla{posicionFila,columnaPotenciaTx};
                fcRx = Tabla{posicionFila,columnaFrecuenciaRx};
                ptRx = Tabla{posicionFila,columnaPotenciaRx};
                
                if isa(fcTx,'double') ==1
                    frecTx=fcTx;
                else
                    frecTx=conversionDecimal(fcTx);
                end

                if isa(fcRx,'double') ==1
                    frecRx=fcRx;
                else
                    frecRx=conversionDecimal(fcRx);
                end

                if isa(ptTx,'double') ==1
                    potTx=ptTx;
                else
                    potTx = conversionDecimal(ptTx);
                end

                if isa(ptRx,'double') ==1
                    potRx=ptRx;
                else
                    potRx = conversionDecimal(ptRx);
                end

                %Figura ESPECTRO FRECUENCIA TX
                FigEspMORONASANTIAGOTX= axes('Units','pixels','Position',[250,50,420,400],'Tag','');
                stem(vectorFrecuenciasTx,vectorPotenciasTx,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2 = stem(frecTx,potTx,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','y',...
                        'Marker','o',...
                        'LineWidth',1.8);
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                hold off;
                grid on;       
            
            
            
                %Figura ESPECTRO FRECUENCIA RX
                FigEspMORONASANTIAGORX= axes('Units','pixels','Position',[730,50,420,400],'Tag','');

                stem(vectorFrecuenciasRx,vectorPotenciasRx,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2 = stem(frecRx,potRx,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','y',...
                        'Marker','o',...
                        'LineWidth',1.8);
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                hold off;
                grid on;
                
                
            end 

        end
                
        
        
    end
    
    
    VHFUHF = uicontrol(handles.PanelPantalla,...
        'style','radiobutton',...
        'units','normalized',...
        'fontsize',12,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.57 0.92 0.08 0.045],...
        'string','VHF-UHF',...
        'Tag','RB5',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %CALLBACK Radio Button VHF UHF
    set(VHFUHF,'Callback',@CallBackVHFUHF);
    function CallBackVHFUHF(source,eventdata)

        %Seleccion de la Tabla VHFUHF 
        Tabla = TablaVHFUHF;
        [filas columnas] = size(Tabla);
        
        %Poner los demas radioButtons como deseleccionados
        set(SIRATV,'Value',0);
        set(SCDMA,'Value',0);
        set(FWA,'Value',0);
        set(ENLACES,'Value',0);
        set(VHFUHF,'Value',1);
        set(MDBA,'Value',0);
        set(AUXILIARES,'Value',0);
        
        %BORRAR TODO DE LA PANTALLA
        HandlePanelPantalla = get(handles.PanelPantalla);
        for k = 1:length(HandlePanelPantalla.Children)
            child = get(HandlePanelPantalla.Children(k));
            tag = child.Tag;            
            switch tag
                case 'RB1'
                case 'RB2'
                case 'RB3'
                case 'RB4'
                case 'RB5'
                case 'RB6'
                case 'RB7'    
                otherwise
                    delete(HandlePanelPantalla.Children(k));
            end
        end
        HandleVentana = get(handles.figure1);
        for k = 1:length(HandleVentana.Children)
            child = get(HandleVentana.Children(k));
            tag = child.Tag;            
            switch tag
                case 'Enlaces'
                case 'EstacionesBase'
                case 'PanelPantalla'
                case 'uitoolbar3'
                case 'GrupoBaseDatos'
                otherwise
                    delete(HandleVentana.Children(k));
            end
        end
        
        
        %RADIO BUTTONS PARA SELECCIONAR CATEGORIA
        GrupoProvincias = uibuttongroup(...
            'visible','on',...
            'fontsize',10,...
            'FontName','Times New Roman',...
            'Position',[0.025 0.4 0.15 0.4],...
            'Title','PROVINCIAS',...
            'Tag', 'GrupoProvincias',...
            'backgroundcolor',[ 0.941 0.941 0.941]);
        
        %AZUAY        
        AZUAY = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.78 0.1 0.04],...
            'string','AZUAY',...
            'Tag','AZUAY',...
            'backgroundcolor',[0.941 0.941 0.941]);        
                 
        %CALLBACK Radio Button AZUAY
        set(AZUAY,'Callback',@CallBackAZUAY);
        function CallBackAZUAY(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',1);
            set(CANAR,'Value',0);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Graficar Espectro y Crear Lista Consecionarios
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'Tx')==1)
                    columnaFrecuenciaTx = j;
                end
                if(strcmp( Tabla(1,j ),'Rx')==1)
                    columnaFrecuenciaRx = j;
                end
                if(strcmp( Tabla(1,j ),'�REAS DE OPERACI�N')==1)
                    columnaProvincia= j;
                end
                if(strcmp( Tabla(1,j ),'POTENCIA')==1)
                    columnaPotenciaTx = j;
                end
                if(strcmp( Tabla(1,j ),'NOMBRES')==1)
                    columnaConcesionarios = j;
                end
            end
            cont=0;
            nombre= repmat({''},1,filas);
            filasNombres=zeros(1,filas);
            vectorFrecuenciasTx=zeros(1,filas);
            vectorFrecuenciasRx=zeros(1,filas);
            vectorPotenciasTx=zeros(1,filas);
            vectorPotenciasRx=ones(1,filas);
            for k= 2:filas       
                frecTx = Tabla{k,columnaFrecuenciaTx};
                frecRx = Tabla{k,columnaFrecuenciaRx};
                prov= Tabla{k,columnaProvincia};
                potTx= Tabla{k,columnaPotenciaTx};
                nomb= Tabla(k,columnaConcesionarios);

                if findstr(prov,'AZUAY')>0;
                    cont = cont+1;
                    
                    if isa(frecTx,'double') ==1
                        vectorFrecuenciasTx(cont)=frecTx;
                    else
                        vectorFrecuenciasTx(cont)=conversionDecimal(frecTx);
                    end
                    
                    if isa(frecRx,'double') ==1
                        vectorFrecuenciasRx(cont)=frecRx;
                    else
                        vectorFrecuenciasRx(cont)=conversionDecimal(frecRx);
                    end
                    
                    if isa(potTx,'double') ==1
                        vectorPotenciasTx(cont) = potTx;
                    else
                        vectorPotenciasTx(cont) = conversionDecimal(potTx);
                    end
                   
                    nombre(cont)= nomb;
                    filasNombres(cont)= k;
                end
            end
            nombre = nombre(1:cont);
            filasNombres = filasNombres(1:cont);
            vectorFrecuenciasTx=vectorFrecuenciasTx(1:cont);
            vectorFrecuenciasRx=vectorFrecuenciasRx(1:cont);
            vectorPotenciasTx=vectorPotenciasTx(1:cont);
            vectorPotenciasRx=vectorPotenciasRx(1:cont);
            
            %Texto ESPECTRO DE FRECUENCIAS TX
            espFrecuenciasAZUAYTX = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.2 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS TX',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA TX
            FigEspAZUAYTX= axes('Units','pixels','Position',[250,50,420,400],'Tag','FigEspAZUAYTX');
            stem(vectorFrecuenciasTx,vectorPotenciasTx,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [MHz]');
            ylabel('Potencia [W]');
            grid on;            
            
            %Texto ESPECTRO DE FRECUENCIAS RX
            espFrecuenciasAZUAYRX = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.62 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS RX',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA RX
            FigEspAZUAYRX= axes('Units','pixels','Position',[730,50,420,400],'Tag','FigEspAZUAYRX');

            stem(vectorFrecuenciasRx,vectorPotenciasRx,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [MHz]');
            ylabel('Potencia [W]');
            grid on;

            %Texto Nombres 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.08 0.3 0.1 0.04],...
                'string','Nombres:',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
             %PopMenu Nombres
             popMenuNombresAZUAY =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',nombre(:),...
                'position',[ 0.01 0.24 0.17 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);         
            
            %CALLBACK Pop Menu Nombre
            set(popMenuNombresAZUAY,'Callback',@CallBackpopMenuNombresAZUAY);
            function CallBackpopMenuNombresAZUAY(source2,eventdata)
                
                %Remarcar las Figuras
                HandleVentana = get(handles.figure1);
                for k = 1:length(HandleVentana.Children)
                    child = get(HandleVentana.Children(k));
                    tag = child.Tag;           
                     if (strcmp( tag,'')==1)
                        delete(HandleVentana.Children(k));
                     end
                end
                
                valor= get(source2,'Value');
                posicionFila = filasNombres(valor);
                
                fcTx = Tabla{posicionFila,columnaFrecuenciaTx};
                ptTx = Tabla{posicionFila,columnaPotenciaTx};
                fcRx = Tabla{posicionFila,columnaFrecuenciaRx};
                ptRx = 1;
                
                if isa(fcTx,'double') ==1
                    frecTx=fcTx;
                else
                    frecTx=conversionDecimal(fcTx);
                end

                if isa(fcRx,'double') ==1
                    frecRx=fcRx;
                else
                    frecRx=conversionDecimal(fcRx);
                end

                if isa(ptTx,'double') ==1
                    potTx=ptTx;
                else
                    potTx = conversionDecimal(ptTx);
                end

                if isa(ptRx,'double') ==1
                    potRx=ptRx;
                else
                    potRx = conversionDecimal(ptRx);
                end

                %Figura ESPECTRO FRECUENCIA TX
                FigEspAZUAYTX= axes('Units','pixels','Position',[250,50,420,400],'Tag','FigEspAZUAYTX');
                stem(vectorFrecuenciasTx,vectorPotenciasTx,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2 = stem(frecTx,potTx,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','y',...
                        'Marker','o',...
                        'LineWidth',1.8);
                xlabel('Frecuencia [MHz]');
                ylabel('Potencia [W]');
                hold off;
                grid on;       
            
            
            
                %Figura ESPECTRO FRECUENCIA RX
                FigEspAZUAYRX= axes('Units','pixels','Position',[730,50,420,400],'Tag','FigEspAZUAYRX');

                stem(vectorFrecuenciasRx,vectorPotenciasRx,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2 = stem(frecRx,potRx,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','y',...
                        'Marker','o',...
                        'LineWidth',1.8);
                xlabel('Frecuencia [MHz]');
                ylabel('Potencia [W]');
                hold off;
                grid on;
                
                
            end 

        end
        
        %CA�AR
        CANAR = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.7 0.1 0.04],...
            'string','CA�AR',...
            'Tag','CANAR',...
            'backgroundcolor',[0.941 0.941 0.941]);

        %CALLBACK Radio Button CANAR
        set(CANAR,'Callback',@CallBackCANAR);
        function CallBackCANAR(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',1);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Graficar Espectro y Crear Lista Consecionarios
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'Tx')==1)
                    columnaFrecuenciaTx = j;
                end
                if(strcmp( Tabla(1,j ),'Rx')==1)
                    columnaFrecuenciaRx = j;
                end
                if(strcmp( Tabla(1,j ),'�REAS DE OPERACI�N')==1)
                    columnaProvincia= j;
                end
                if(strcmp( Tabla(1,j ),'POTENCIA')==1)
                    columnaPotenciaTx = j;
                end
                if(strcmp( Tabla(1,j ),'NOMBRES')==1)
                    columnaConcesionarios = j;
                end
            end
            cont=0;
            nombre= repmat({''},1,filas);
            filasNombres=zeros(1,filas);
            vectorFrecuenciasTx=zeros(1,filas);
            vectorFrecuenciasRx=zeros(1,filas);
            vectorPotenciasTx=zeros(1,filas);
            vectorPotenciasRx=ones(1,filas);
            for k= 2:filas       
                frecTx = Tabla{k,columnaFrecuenciaTx};
                frecRx = Tabla{k,columnaFrecuenciaRx};
                prov= Tabla{k,columnaProvincia};
                potTx= Tabla{k,columnaPotenciaTx};
                nomb= Tabla(k,columnaConcesionarios);

                if findstr(prov,'CA�AR')>0;
                    cont = cont+1;
                    
                    if isa(frecTx,'double') ==1
                        vectorFrecuenciasTx(cont)=frecTx;
                    else
                        vectorFrecuenciasTx(cont)=conversionDecimal(frecTx);
                    end
                    
                    if isa(frecRx,'double') ==1
                        vectorFrecuenciasRx(cont)=frecRx;
                    else
                        vectorFrecuenciasRx(cont)=conversionDecimal(frecRx);
                    end
                    
                    if isa(potTx,'double') ==1
                        vectorPotenciasTx(cont) = potTx;
                    else
                        vectorPotenciasTx(cont) = conversionDecimal(potTx);
                    end
                   
                    nombre(cont)= nomb;
                    filasNombres(cont)= k;
                end
            end
            nombre = nombre(1:cont);
            filasNombres = filasNombres(1:cont);
            vectorFrecuenciasTx=vectorFrecuenciasTx(1:cont);
            vectorFrecuenciasRx=vectorFrecuenciasRx(1:cont);
            vectorPotenciasTx=vectorPotenciasTx(1:cont);
            vectorPotenciasRx=vectorPotenciasRx(1:cont);
            
            %Texto ESPECTRO DE FRECUENCIAS TX
            espFrecuenciasCANARTX = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.2 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS TX',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA TX
            FigEspCANARTX= axes('Units','pixels','Position',[250,50,420,400],'Tag','');
            stem(vectorFrecuenciasTx,vectorPotenciasTx,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [MHz]');
            ylabel('Potencia [W]');
            grid on;            
            
            %Texto ESPECTRO DE FRECUENCIAS RX
            espFrecuenciasCANARRX = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.62 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS RX',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA RX
            FigEspCANARRX= axes('Units','pixels','Position',[730,50,420,400],'Tag','');

            stem(vectorFrecuenciasRx,vectorPotenciasRx,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [MHz]');
            ylabel('Potencia [W]');
            grid on;

            %Texto Nombres 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.08 0.3 0.1 0.04],...
                'string','Nombres:',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
             %PopMenu Nombres
             popMenuNombresCANAR =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',nombre(:),...
                'position',[ 0.01 0.24 0.17 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);         
            
            %CALLBACK Pop Menu Nombre
            set(popMenuNombresCANAR,'Callback',@CallBackpopMenuNombresCANAR);
            function CallBackpopMenuNombresCANAR(source2,eventdata)
                
                %Remarcar las Figuras
                HandleVentana = get(handles.figure1);
                for k = 1:length(HandleVentana.Children)
                    child = get(HandleVentana.Children(k));
                    tag = child.Tag;           
                     if (strcmp( tag,'')==1)
                        delete(HandleVentana.Children(k));
                     end
                end
                
                valor= get(source2,'Value');
                posicionFila = filasNombres(valor);
                
                fcTx = Tabla{posicionFila,columnaFrecuenciaTx};
                ptTx = Tabla{posicionFila,columnaPotenciaTx};
                fcRx = Tabla{posicionFila,columnaFrecuenciaRx};
                ptRx = 1;
                
                if isa(fcTx,'double') ==1
                    frecTx=fcTx;
                else
                    frecTx=conversionDecimal(fcTx);
                end

                if isa(fcRx,'double') ==1
                    frecRx=fcRx;
                else
                    frecRx=conversionDecimal(fcRx);
                end

                if isa(ptTx,'double') ==1
                    potTx=ptTx;
                else
                    potTx = conversionDecimal(ptTx);
                end

                if isa(ptRx,'double') ==1
                    potRx=ptRx;
                else
                    potRx = conversionDecimal(ptRx);
                end

                %Figura ESPECTRO FRECUENCIA TX
                FigEspCANARTX= axes('Units','pixels','Position',[250,50,420,400],'Tag','');
                stem(vectorFrecuenciasTx,vectorPotenciasTx,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2 = stem(frecTx,potTx,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','y',...
                        'Marker','o',...
                        'LineWidth',1.8);
                xlabel('Frecuencia [MHz]');
                ylabel('Potencia [W]');
                hold off;
                grid on;       
            
            
            
                %Figura ESPECTRO FRECUENCIA RX
                FigEspCANARRX= axes('Units','pixels','Position',[730,50,420,400],'Tag','');

                stem(vectorFrecuenciasRx,vectorPotenciasRx,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2 = stem(frecRx,potRx,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','y',...
                        'Marker','o',...
                        'LineWidth',1.8);
                xlabel('Frecuencia [MHz]');
                ylabel('Potencia [W]');
                hold off;
                grid on;
                
                
            end 

        end
        

        %LOJA
        LOJA = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.62 0.1 0.04],...
            'string','LOJA',...
            'Tag','LOJA',...
            'backgroundcolor',[0.941 0.941 0.941]);        
       
        %CALLBACK Radio Button LOJA
        set(LOJA,'Callback',@CallBackLOJA);
        function CallBackLOJA(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',0);
            set(LOJA,'Value',1);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Graficar Espectro y Crear Lista Consecionarios
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'Tx')==1)
                    columnaFrecuenciaTx = j;
                end
                if(strcmp( Tabla(1,j ),'Rx')==1)
                    columnaFrecuenciaRx = j;
                end
                if(strcmp( Tabla(1,j ),'�REAS DE OPERACI�N')==1)
                    columnaProvincia= j;
                end
                if(strcmp( Tabla(1,j ),'POTENCIA')==1)
                    columnaPotenciaTx = j;
                end
                if(strcmp( Tabla(1,j ),'NOMBRES')==1)
                    columnaConcesionarios = j;
                end
            end
            cont=0;
            nombre= repmat({''},1,filas);
            filasNombres=zeros(1,filas);
            vectorFrecuenciasTx=zeros(1,filas);
            vectorFrecuenciasRx=zeros(1,filas);
            vectorPotenciasTx=zeros(1,filas);
            vectorPotenciasRx=ones(1,filas);
            for k= 2:filas       
                frecTx = Tabla{k,columnaFrecuenciaTx};
                frecRx = Tabla{k,columnaFrecuenciaRx};
                prov= Tabla{k,columnaProvincia};
                potTx= Tabla{k,columnaPotenciaTx};
                nomb= Tabla(k,columnaConcesionarios);

                if findstr(prov,'LOJA')>0;
                    cont = cont+1;
                    
                    if isa(frecTx,'double') ==1
                        vectorFrecuenciasTx(cont)=frecTx;
                    else
                        vectorFrecuenciasTx(cont)=conversionDecimal(frecTx);
                    end
                    
                    if isa(frecRx,'double') ==1
                        vectorFrecuenciasRx(cont)=frecRx;
                    else
                        vectorFrecuenciasRx(cont)=conversionDecimal(frecRx);
                    end
                    
                    if isa(potTx,'double') ==1
                        vectorPotenciasTx(cont) = potTx;
                    else
                        vectorPotenciasTx(cont) = conversionDecimal(potTx);
                    end
                   
                    nombre(cont)= nomb;
                    filasNombres(cont)= k;
                end
            end
            nombre = nombre(1:cont);
            filasNombres = filasNombres(1:cont);
            vectorFrecuenciasTx=vectorFrecuenciasTx(1:cont);
            vectorFrecuenciasRx=vectorFrecuenciasRx(1:cont);
            vectorPotenciasTx=vectorPotenciasTx(1:cont);
            vectorPotenciasRx=vectorPotenciasRx(1:cont);
            
            %Texto ESPECTRO DE FRECUENCIAS TX
            espFrecuenciasLOJATX = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.2 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS TX',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA TX
            FigEspLOJATX= axes('Units','pixels','Position',[250,50,420,400],'Tag','');
            stem(vectorFrecuenciasTx,vectorPotenciasTx,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [Hz]');
            ylabel('Potencia [W]');
            grid on;            
            
            %Texto ESPECTRO DE FRECUENCIAS RX
            espFrecuenciasLOJARX = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.62 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS RX',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA RX
            FigEspLOJARX= axes('Units','pixels','Position',[730,50,420,400],'Tag','');

            stem(vectorFrecuenciasRx,vectorPotenciasRx,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [Hz]');
            ylabel('Potencia [W]');
            grid on;

            %Texto Nombres 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.08 0.3 0.1 0.04],...
                'string','Nombres:',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
             %PopMenu Nombres
             popMenuNombresLOJA =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',nombre(:),...
                'position',[ 0.01 0.24 0.17 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);         
            
            %CALLBACK Pop Menu Nombre
            set(popMenuNombresLOJA,'Callback',@CallBackpopMenuNombresLOJA);
            function CallBackpopMenuNombresLOJA(source2,eventdata)
                
                %Remarcar las Figuras
                HandleVentana = get(handles.figure1);
                for k = 1:length(HandleVentana.Children)
                    child = get(HandleVentana.Children(k));
                    tag = child.Tag;           
                     if (strcmp( tag,'')==1)
                        delete(HandleVentana.Children(k));
                     end
                end
                
                valor= get(source2,'Value');
                posicionFila = filasNombres(valor);
                
                fcTx = Tabla{posicionFila,columnaFrecuenciaTx};
                ptTx = Tabla{posicionFila,columnaPotenciaTx};
                fcRx = Tabla{posicionFila,columnaFrecuenciaRx};
                ptRx = 1;
                
                if isa(fcTx,'double') ==1
                    frecTx=fcTx;
                else
                    frecTx=conversionDecimal(fcTx);
                end

                if isa(fcRx,'double') ==1
                    frecRx=fcRx;
                else
                    frecRx=conversionDecimal(fcRx);
                end

                if isa(ptTx,'double') ==1
                    potTx=ptTx;
                else
                    potTx = conversionDecimal(ptTx);
                end

                if isa(ptRx,'double') ==1
                    potRx=ptRx;
                else
                    potRx = conversionDecimal(ptRx);
                end

                %Figura ESPECTRO FRECUENCIA TX
                FigEspLOJATX= axes('Units','pixels','Position',[250,50,420,400],'Tag','');
                stem(vectorFrecuenciasTx,vectorPotenciasTx,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2 = stem(frecTx,potTx,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','y',...
                        'Marker','o',...
                        'LineWidth',1.8);
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                hold off;
                grid on;       
            
            
            
                %Figura ESPECTRO FRECUENCIA RX
                FigEspLOJARX= axes('Units','pixels','Position',[730,50,420,400],'Tag','');

                stem(vectorFrecuenciasRx,vectorPotenciasRx,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2 = stem(frecRx,potRx,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','y',...
                        'Marker','o',...
                        'LineWidth',1.8);
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                hold off;
                grid on;
                
                
            end 

        end
        
             
        
        %ZAMORA CHINCHIPE
        ZAMORACHINCHIPE = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.54 0.12 0.04],...
            'string','ZAMORA CHINCHIPE',...
            'Tag','ZAMORACHINCHIPE',...
            'backgroundcolor',[0.941 0.941 0.941]);
        
        %CALLBACK Radio Button ZAMORA CHINCHIPE
        set(ZAMORACHINCHIPE,'Callback',@CallBackZAMORACHINCHIPE);
        function CallBackZAMORACHINCHIPE(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',0);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',1);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Graficar Espectro y Crear Lista Consecionarios
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'Tx')==1)
                    columnaFrecuenciaTx = j;
                end
                if(strcmp( Tabla(1,j ),'Rx')==1)
                    columnaFrecuenciaRx = j;
                end
                if(strcmp( Tabla(1,j ),'�REAS DE OPERACI�N')==1)
                    columnaProvincia= j;
                end
                if(strcmp( Tabla(1,j ),'POTENCIA')==1)
                    columnaPotenciaTx = j;
                end
                if(strcmp( Tabla(1,j ),'NOMBRES')==1)
                    columnaConcesionarios = j;
                end
            end
            cont=0;
            nombre= repmat({''},1,filas);
            filasNombres=zeros(1,filas);
            vectorFrecuenciasTx=zeros(1,filas);
            vectorFrecuenciasRx=zeros(1,filas);
            vectorPotenciasTx=zeros(1,filas);
            vectorPotenciasRx=ones(1,filas);
            for k= 2:filas       
                frecTx = Tabla{k,columnaFrecuenciaTx};
                frecRx = Tabla{k,columnaFrecuenciaRx};
                prov= Tabla{k,columnaProvincia};
                potTx= Tabla{k,columnaPotenciaTx};
                nomb= Tabla(k,columnaConcesionarios);

                if findstr(prov,'ZAMORA')>0;
                    cont = cont+1;
                    
                    if isa(frecTx,'double') ==1
                        vectorFrecuenciasTx(cont)=frecTx;
                    else
                        vectorFrecuenciasTx(cont)=conversionDecimal(frecTx);
                    end
                    
                    if isa(frecRx,'double') ==1
                        vectorFrecuenciasRx(cont)=frecRx;
                    else
                        vectorFrecuenciasRx(cont)=conversionDecimal(frecRx);
                    end
                    
                    if isa(potTx,'double') ==1
                        vectorPotenciasTx(cont) = potTx;
                    else
                        vectorPotenciasTx(cont) = conversionDecimal(potTx);
                    end
                   
                    nombre(cont)= nomb;
                    filasNombres(cont)= k;
                end
            end
            nombre = nombre(1:cont);
            filasNombres = filasNombres(1:cont);
            vectorFrecuenciasTx=vectorFrecuenciasTx(1:cont);
            vectorFrecuenciasRx=vectorFrecuenciasRx(1:cont);
            vectorPotenciasTx=vectorPotenciasTx(1:cont);
            vectorPotenciasRx=vectorPotenciasRx(1:cont);
            
            %Texto ESPECTRO DE FRECUENCIAS TX
            espFrecuenciasZAMORACHINCHIPETX = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.2 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS TX',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA TX
            FigEspZAMORACHINCHIPETX= axes('Units','pixels','Position',[250,50,420,400],'Tag','');
            stem(vectorFrecuenciasTx,vectorPotenciasTx,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [Hz]');
            ylabel('Potencia [W]');
            grid on;            
            
            %Texto ESPECTRO DE FRECUENCIAS RX
            espFrecuenciasZAMORACHINCHIPERX = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.62 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS RX',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA RX
            FigEspZAMORACHINCHIPERX= axes('Units','pixels','Position',[730,50,420,400],'Tag','');

            stem(vectorFrecuenciasRx,vectorPotenciasRx,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [Hz]');
            ylabel('Potencia [W]');
            grid on;

            %Texto Nombres 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.08 0.3 0.1 0.04],...
                'string','Nombres:',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
             %PopMenu Nombres
             popMenuNombresZAMORACHINCHIPE =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',nombre(:),...
                'position',[ 0.01 0.24 0.17 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);         
            
            %CALLBACK Pop Menu Nombre
            set(popMenuNombresZAMORACHINCHIPE,'Callback',@CallBackpopMenuNombresZAMORACHINCHIPE);
            function CallBackpopMenuNombresZAMORACHINCHIPE(source2,eventdata)
                
                %Remarcar las Figuras
                HandleVentana = get(handles.figure1);
                for k = 1:length(HandleVentana.Children)
                    child = get(HandleVentana.Children(k));
                    tag = child.Tag;           
                     if (strcmp( tag,'')==1)
                        delete(HandleVentana.Children(k));
                     end
                end
                
                valor= get(source2,'Value');
                posicionFila = filasNombres(valor);
                
                fcTx = Tabla{posicionFila,columnaFrecuenciaTx};
                ptTx = Tabla{posicionFila,columnaPotenciaTx};
                fcRx = Tabla{posicionFila,columnaFrecuenciaRx};
                ptRx = 1;
                
                if isa(fcTx,'double') ==1
                    frecTx=fcTx;
                else
                    frecTx=conversionDecimal(fcTx);
                end

                if isa(fcRx,'double') ==1
                    frecRx=fcRx;
                else
                    frecRx=conversionDecimal(fcRx);
                end

                if isa(ptTx,'double') ==1
                    potTx=ptTx;
                else
                    potTx = conversionDecimal(ptTx);
                end

                if isa(ptRx,'double') ==1
                    potRx=ptRx;
                else
                    potRx = conversionDecimal(ptRx);
                end

                %Figura ESPECTRO FRECUENCIA TX
                FigEspZAMORACHINCHIPETX= axes('Units','pixels','Position',[250,50,420,400],'Tag','');
                stem(vectorFrecuenciasTx,vectorPotenciasTx,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2 = stem(frecTx,potTx,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','y',...
                        'Marker','o',...
                        'LineWidth',1.8);
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                hold off;
                grid on;       
            
            
            
                %Figura ESPECTRO FRECUENCIA RX
                FigEspZAMORACHINCHIPERX= axes('Units','pixels','Position',[730,50,420,400],'Tag','');

                stem(vectorFrecuenciasRx,vectorPotenciasRx,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2 = stem(frecRx,potRx,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','y',...
                        'Marker','o',...
                        'LineWidth',1.8);
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                hold off;
                grid on;
                
                
            end 

        end
        
        %MORONA SANTIAGO
        MORONASANTIAGO = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.46 0.13 0.04],...
            'string','MORONA SANTIAGO',...
            'Tag','MORONASANTIAGO',...
            'backgroundcolor',[0.941 0.941 0.941]);

        %CALLBACK Radio Button MORONA SANTIAGO
        set(MORONASANTIAGO,'Callback',@CallBackMORONASANTIAGO);
        function CallBackMORONASANTIAGO(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',0);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',1);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Graficar Espectro y Crear Lista Consecionarios
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'Tx')==1)
                    columnaFrecuenciaTx = j;
                end
                if(strcmp( Tabla(1,j ),'Rx')==1)
                    columnaFrecuenciaRx = j;
                end
                if(strcmp( Tabla(1,j ),'�REAS DE OPERACI�N')==1)
                    columnaProvincia= j;
                end
                if(strcmp( Tabla(1,j ),'POTENCIA')==1)
                    columnaPotenciaTx = j;
                end
                if(strcmp( Tabla(1,j ),'NOMBRES')==1)
                    columnaConcesionarios = j;
                end
            end
            cont=0;
            nombre= repmat({''},1,filas);
            filasNombres=zeros(1,filas);
            vectorFrecuenciasTx=zeros(1,filas);
            vectorFrecuenciasRx=zeros(1,filas);
            vectorPotenciasTx=zeros(1,filas);
            vectorPotenciasRx=ones(1,filas);
            for k= 2:filas       
                frecTx = Tabla{k,columnaFrecuenciaTx};
                frecRx = Tabla{k,columnaFrecuenciaRx};
                prov= Tabla{k,columnaProvincia};
                potTx= Tabla{k,columnaPotenciaTx};
                nomb= Tabla(k,columnaConcesionarios);

                if findstr(prov,'MORONA')>0;
                    cont = cont+1;
                    
                    if isa(frecTx,'double') ==1
                        vectorFrecuenciasTx(cont)=frecTx;
                    else
                        vectorFrecuenciasTx(cont)=conversionDecimal(frecTx);
                    end
                    
                    if isa(frecRx,'double') ==1
                        vectorFrecuenciasRx(cont)=frecRx;
                    else
                        vectorFrecuenciasRx(cont)=conversionDecimal(frecRx);
                    end
                    
                    if isa(potTx,'double') ==1
                        vectorPotenciasTx(cont) = potTx;
                    else
                        vectorPotenciasTx(cont) = conversionDecimal(potTx);
                    end
                   
                    nombre(cont)= nomb;
                    filasNombres(cont)= k;
                end
            end
            nombre = nombre(1:cont);
            filasNombres = filasNombres(1:cont);
            vectorFrecuenciasTx=vectorFrecuenciasTx(1:cont);
            vectorFrecuenciasRx=vectorFrecuenciasRx(1:cont);
            vectorPotenciasTx=vectorPotenciasTx(1:cont);
            vectorPotenciasRx=vectorPotenciasRx(1:cont);
            
            %Texto ESPECTRO DE FRECUENCIAS TX
            espFrecuenciasMORONASANTIAGOTX = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.2 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS TX',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA TX
            FigEspMORONASANTIAGOTX= axes('Units','pixels','Position',[250,50,420,400],'Tag','');
            stem(vectorFrecuenciasTx,vectorPotenciasTx,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [Hz]');
            ylabel('Potencia [W]');
            grid on;            
            
            %Texto ESPECTRO DE FRECUENCIAS RX
            espFrecuenciasMORONASANTIAGORX = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.62 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS RX',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA RX
            FigEspZAMORONASANTIAGORX= axes('Units','pixels','Position',[730,50,420,400],'Tag','');

            stem(vectorFrecuenciasRx,vectorPotenciasRx,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [Hz]');
            ylabel('Potencia [W]');
            grid on;

            %Texto Nombres 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.08 0.3 0.1 0.04],...
                'string','Nombres:',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
             %PopMenu Nombres
             popMenuNombresMORONASANTIAGO =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',nombre(:),...
                'position',[ 0.01 0.24 0.17 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);         
            
            %CALLBACK Pop Menu Nombre
            set(popMenuNombresMORONASANTIAGO,'Callback',@CallBackpopMenuNombresMORONASANTIAGO);
            function CallBackpopMenuNombresMORONASANTIAGO(source2,eventdata)
                
                %Remarcar las Figuras
                HandleVentana = get(handles.figure1);
                for k = 1:length(HandleVentana.Children)
                    child = get(HandleVentana.Children(k));
                    tag = child.Tag;           
                     if (strcmp( tag,'')==1)
                        delete(HandleVentana.Children(k));
                     end
                end
                
                valor= get(source2,'Value');
                posicionFila = filasNombres(valor);
                
                fcTx = Tabla{posicionFila,columnaFrecuenciaTx};
                ptTx = Tabla{posicionFila,columnaPotenciaTx};
                fcRx = Tabla{posicionFila,columnaFrecuenciaRx};
                ptRx = 1;
                
                if isa(fcTx,'double') ==1
                    frecTx=fcTx;
                else
                    frecTx=conversionDecimal(fcTx);
                end

                if isa(fcRx,'double') ==1
                    frecRx=fcRx;
                else
                    frecRx=conversionDecimal(fcRx);
                end

                if isa(ptTx,'double') ==1
                    potTx=ptTx;
                else
                    potTx = conversionDecimal(ptTx);
                end

                if isa(ptRx,'double') ==1
                    potRx=ptRx;
                else
                    potRx = conversionDecimal(ptRx);
                end

                %Figura ESPECTRO FRECUENCIA TX
                FigEspMORONASANTIAGOTX= axes('Units','pixels','Position',[250,50,420,400],'Tag','');
                stem(vectorFrecuenciasTx,vectorPotenciasTx,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2 = stem(frecTx,potTx,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','y',...
                        'Marker','o',...
                        'LineWidth',1.8);
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                hold off;
                grid on;       
            
            
            
                %Figura ESPECTRO FRECUENCIA RX
                FigEspMORONASANTIAGORX= axes('Units','pixels','Position',[730,50,420,400],'Tag','');

                stem(vectorFrecuenciasRx,vectorPotenciasRx,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2 = stem(frecRx,potRx,...
                        'LineStyle','-',...
                        'Color','red',...
                        'MarkerFaceColor','red',...
                        'MarkerEdgeColor','y',...
                        'Marker','o',...
                        'LineWidth',1.8);
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                hold off;
                grid on;
                
                
            end 

        end
                
        
        
    end 
    
    MDBA = uicontrol(handles.PanelPantalla,...
        'style','radiobutton',...
        'units','normalized',...
        'fontsize',12,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.72 0.92 0.06 0.045],...
        'string','MDBA',...
        'Tag','RB6',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %CALLBACK Radio Button MDBA
    set(MDBA,'Callback',@CallBackMDBA);
    function CallBackMDBA(source,eventdata)

        %Seleccion de la Tabla MDBA 
        Tabla = TablaMDBA;
        [filas columnas] = size(Tabla);

        %Poner los demas radioButtons como deseleccionados
        set(SIRATV,'Value',0);
        set(SCDMA,'Value',0);
        set(FWA,'Value',0);
        set(ENLACES,'Value',0);
        set( VHFUHF,'Value',0);
        set(MDBA,'Value',1);
        set(AUXILIARES,'Value',0);

        %BORRAR TODO DE LA PANTALLA
        HandlePanelPantalla = get(handles.PanelPantalla);
        for k = 1:length(HandlePanelPantalla.Children)
            child = get(HandlePanelPantalla.Children(k));
            tag = child.Tag;            
            switch tag
                case 'RB1'
                case 'RB2'
                case 'RB3'
                case 'RB4'
                case 'RB5'
                case 'RB6'
                case 'RB7'    
                otherwise
                    delete(HandlePanelPantalla.Children(k));
            end
        end
        HandleVentana = get(handles.figure1);
        for k = 1:length(HandleVentana.Children)
            child = get(HandleVentana.Children(k));
            tag = child.Tag;            
            switch tag
                case 'Enlaces'
                case 'EstacionesBase'
                case 'PanelPantalla'
                case 'uitoolbar3'
                case 'GrupoBaseDatos'
                otherwise
                    delete(HandleVentana.Children(k));
            end
        end

        %RADIO BUTTONS PARA SELECCIONAR CATEGORIA
        GrupoProvincias = uibuttongroup(...
            'visible','on',...
            'fontsize',10,...
            'FontName','Times New Roman',...
            'Position',[0.025 0.4 0.15 0.4],...
            'Title','PROVINCIAS',...
            'Tag', 'GrupoProvincias',...
            'backgroundcolor',[ 0.941 0.941 0.941]);

        %AZUAY        
        AZUAY = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.78 0.1 0.04],...
            'string','AZUAY',...
            'Tag','AZUAY',...
            'backgroundcolor',[0.941 0.941 0.941]);        

        %CALLBACK Radio Button AZUAY
        set(AZUAY,'Callback',@CallBackAZUAY);
        function CallBackAZUAY(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',1);
            set(CANAR,'Value',0);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);

            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end

            %Crear Lista Consecionarios
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'PROVINCIA A')==1)
                    columnaProvincia= j;
                end
                if(strcmp( Tabla(1,j ),'NOMBRES')==1)
                    columnaConcesionarios = j;
                end
                if(strcmp( Tabla(1,j ),'BANDA OPERACI�N')==1)
                    columnaBanda = j;
                end
            end
            cont=0;
            nombre= repmat({''},1,filas);
            filasNombres=zeros(1,filas);
            for k= 2:filas       
                prov= Tabla{k,columnaProvincia};
                nomb= Tabla(k,columnaConcesionarios);
                if findstr(prov,'AZUAY')>0;
                    cont = cont+1;
                    nombre(cont)= nomb;
                    filasNombres(cont)= k;
                end
            end
            nombre = nombre(1:cont);
            filasNombres = filasNombres(1:cont);
            
            %Barras ANCHO BANDA
            EspFrecAZUAYMDBA = axes('Units','pixels',...
                'Position',[300,50,600,400],...
                'Tag','EspFrecAZUAYMDBA');
            y=[1 1 1 1 1 1];
            x_l=[2400 5150 5250 5470 5725 902];
            x_u=[2483.5 5250 5350 5725 5850 928];
            for z=1:length(y)
                patch([x_l(z) x_l(z) x_u(z) x_u(z)],[0 y(z) y(z) 0],'b');
            end
            xlabel('Frecuencia [MHz]');
            ylabel('Potencia [W]');
            grid on;

            %Texto ESPECTRO DE FRECUENCIAS TX
            espFrecuenciasAZUAYMDBA = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.32 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS',...
                'backgroundcolor',[0.941 0.941 0.941]);        


            %Texto Nombres 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.85 0.81 0.1 0.04],...
                'string','Nombres:',...
                'backgroundcolor',[0.941 0.941 0.941]);

             %PopMenu Nombres
             popMenuNombresAZUAY =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',nombre(:),...
                'position',[ 0.81 0.75 0.17 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);

            %CALLBACK Pop Menu Nombre
            set(popMenuNombresAZUAY,'Callback',@CallBackpopMenuNombresAZUAY);
            function CallBackpopMenuNombresAZUAY(source2,eventdata)

                valor= get(source2,'Value');
                posicionFila = filasNombres(valor);
                banda=Tabla{posicionFila,columnaBanda};
                banda = substring(banda,0,2);
                bd = str2double(banda);
                switch bd
                    case 240
                        fmin = 2400;
                        fmax = 2483.5;
                    case 515
                        fmin = 5150;
                        fmax = 5250;
                    case 525
                        fmin = 5250;
                        fmax = 5350;
                    case 547
                        fmin = 5470;
                        fmax = 5725;
                    case 572
                        fmin = 5725;
                        fmax = 5850;
                    case 902
                        fmin = 902;
                        fmax = 928;
                end
                               
                %Remarcar las Figuras
                cla;
                %Barras ANCHO BANDA
                hold on;
                y=[1 1 1 1 1 1];
                x_l=[2400 5150 5250 5470 5725 902];
                x_u=[2483.5 5250 5350 5725 5850 928];
                for z=1:length(y)
                    patch([x_l(z) x_l(z) x_u(z) x_u(z)],[0 y(z) y(z) 0],'b');
                end
                y=[1];
                x_l=[fmin];
                x_u=[fmax];
                for z=1:length(y)
                    patch([x_l(z) x_l(z) x_u(z) x_u(z)],[0 y(z) y(z) 0],'r');
                end
                hold off;
                xlabel('Frecuencia [MHz]');
                ylabel('Potencia [W]');
                grid on;
                
                %Mostrar Datos de Consesionaria
                tablaConcesionarios =  uicontrol(handles.PanelPantalla,...
                    'Tag','tboxNombres',...
                    'style','listbox',...
                    'units','normalized',...
                    'HorizontalAlignment','center',...
                    'fontsize',10,...
                    'position',[ 0.795 0.02 0.2 0.74],...
                    'backgroundcolor',[0.941 0.941 0.941]);
                
                
                contador = 1;
                datos = cell(2*columnas,1);
                for z = 1 :columnas
                    if isa(Tabla{posicionFila,z},'double') ==1
                        aux = num2str( Tabla{posicionFila,z});
                    else
                        aux = Tabla{posicionFila,z};
                    end
                    datos(contador)= strcat(Tabla(1,z),': ',aux);
                    contador=contador+2;
                end
                set(tablaConcesionarios,'string',datos());

            end 

        end

        %CA�AR
        CANAR = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.7 0.1 0.04],...
            'string','CA�AR',...
            'Tag','CANAR',...
            'backgroundcolor',[0.941 0.941 0.941]);

        %CALLBACK Radio Button CANAR
        set(CANAR,'Callback',@CallBackCANAR);
        function CallBackCANAR(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',1);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);

            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end


            %Crear Lista Consecionarios
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'PROVINCIA A')==1)
                    columnaProvincia= j;
                end
                if(strcmp( Tabla(1,j ),'NOMBRES')==1)
                    columnaConcesionarios = j;
                end
                if(strcmp( Tabla(1,j ),'BANDA OPERACI�N')==1)
                    columnaBanda = j;
                end
            end
            cont=0;
            nombre= repmat({''},1,filas);
            filasNombres=zeros(1,filas);
            for k= 2:filas       
                prov= Tabla{k,columnaProvincia};
                nomb= Tabla(k,columnaConcesionarios);
                if findstr(prov,'CA�AR')>0;
                    cont = cont+1;
                    nombre(cont)= nomb;
                    filasNombres(cont)= k;
                end
            end
            nombre = nombre(1:cont);
            filasNombres = filasNombres(1:cont);
            
            %Barras ANCHO BANDA
            EspFrecMDBACANAR = axes('Units','pixels',...
                'Position',[300,50,600,400],...
                'Tag','EspFrecMDBACANAR');
            y=[1 1 1 1 1];
            x_l=[2400 5150 5250 5470 5725];
            x_u=[2483.5 5250 5350 5725 5850];
            for z=1:length(y)
                patch([x_l(z) x_l(z) x_u(z) x_u(z)],[0 y(z) y(z) 0],'b');
            end
            xlabel('Frecuencia [MHz]');
            ylabel('Potencia [W]');
            grid on;

            %Texto ESPECTRO DE FRECUENCIAS TX
            espFrecuenciasAZUAYMDBA = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.32 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS',...
                'backgroundcolor',[0.941 0.941 0.941]);        


            %Texto Nombres 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.85 0.81 0.1 0.04],...
                'string','Nombres:',...
                'backgroundcolor',[0.941 0.941 0.941]);

             %PopMenu Nombres
             popMenuNombresCANAR =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',nombre(:),...
                'position',[ 0.81 0.75 0.17 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);

            %CALLBACK Pop Menu Nombre
            set(popMenuNombresCANAR,'Callback',@CallBackpopMenuNombresCANAR);
            function CallBackpopMenuNombresCANAR(source2,eventdata)

                valor= get(source2,'Value');
                posicionFila = filasNombres(valor);
                banda=Tabla{posicionFila,columnaBanda};
                banda = substring(banda,0,2);
                bd = str2double(banda);
                switch bd
                    case 240
                        fmin = 2400;
                        fmax = 2483.5;
                    case 515
                        fmin = 5150;
                        fmax = 5250;
                    case 525
                        fmin = 5250;
                        fmax = 5350;
                    case 547
                        fmin = 5470;
                        fmax = 5725;
                    case 572
                        fmin = 5725;
                        fmax = 5850;
                end
                               
                %Remarcar las Figuras
                cla;
                %Barras ANCHO BANDA
                hold on;
                y=[1 1 1 1 1];
                x_l=[2400 5150 5250 5470 5725 ];
                x_u=[2483.5 5250 5350 5725 5850 ];
                for z=1:length(y)
                    patch([x_l(z) x_l(z) x_u(z) x_u(z)],[0 y(z) y(z) 0],'b');
                end
                y=[1];
                x_l=[fmin];
                x_u=[fmax];
                for z=1:length(y)
                    patch([x_l(z) x_l(z) x_u(z) x_u(z)],[0 y(z) y(z) 0],'r');
                end
                hold off;
                xlabel('Frecuencia [MHz]');
                ylabel('Potencia [W]');
                grid on;
                
                %Mostrar Datos de Consesionaria
                tablaConcesionarios =  uicontrol(handles.PanelPantalla,...
                    'Tag','tboxNombres',...
                    'style','listbox',...
                    'units','normalized',...
                    'HorizontalAlignment','center',...
                    'fontsize',10,...
                    'position',[ 0.795 0.02 0.2 0.74],...
                    'backgroundcolor',[0.941 0.941 0.941]);
                
                
                contador = 1;
                datos = cell(2*columnas,1);
                for z = 1 :columnas
                    if isa(Tabla{posicionFila,z},'double') ==1
                        aux = num2str( Tabla{posicionFila,z});
                    else
                        aux = Tabla{posicionFila,z};
                    end
                    datos(contador)= strcat(Tabla(1,z),': ',aux);
                    contador=contador+2;
                end
                set(tablaConcesionarios,'string',datos());

            end 


        end


        %LOJA
        LOJA = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.62 0.1 0.04],...
            'string','LOJA',...
            'Tag','LOJA',...
            'backgroundcolor',[0.941 0.941 0.941]);        

        %CALLBACK Radio Button LOJA
        set(LOJA,'Callback',@CallBackLOJA);
        function CallBackLOJA(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',0);
            set(LOJA,'Value',1);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);

            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end

            %Crear Lista Consecionarios
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'PROVINCIA A')==1)
                    columnaProvincia= j;
                end
                if(strcmp( Tabla(1,j ),'NOMBRES')==1)
                    columnaConcesionarios = j;
                end
                if(strcmp( Tabla(1,j ),'BANDA OPERACI�N')==1)
                    columnaBanda = j;
                end
            end
            cont=0;
            nombre= repmat({''},1,filas);
            filasNombres=zeros(1,filas);
            for k= 2:filas       
                prov= Tabla{k,columnaProvincia};
                nomb= Tabla(k,columnaConcesionarios);
                if findstr(prov,'LOJA')>0;
                    cont = cont+1;
                    nombre(cont)= nomb;
                    filasNombres(cont)= k;
                end
            end
            nombre = nombre(1:cont);
            filasNombres = filasNombres(1:cont);
            
            %Barras ANCHO BANDA
            EspFrecLOJAMDBA = axes('Units','pixels',...
                'Position',[300,50,600,400],...
                'Tag','EspFrecLOJAMDBA');
            y=[1 1 1 1 1];
            x_l=[2400 5150 5250 5470 5725];
            x_u=[2483.5 5250 5350 5725 5850];
            for z=1:length(y)
                patch([x_l(z) x_l(z) x_u(z) x_u(z)],[0 y(z) y(z) 0],'b');
            end
            xlabel('Frecuencia [MHz]');
            ylabel('Potencia [W]');
            grid on;

            %Texto ESPECTRO DE FRECUENCIAS TX
            espFrecuenciasAZUAYMDBA = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.32 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS',...
                'backgroundcolor',[0.941 0.941 0.941]);        


            %Texto Nombres 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.85 0.81 0.1 0.04],...
                'string','Nombres:',...
                'backgroundcolor',[0.941 0.941 0.941]);

             %PopMenu Nombres
             popMenuNombresLOJA =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',nombre(:),...
                'position',[ 0.81 0.75 0.17 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);

            %CALLBACK Pop Menu Nombre
            set(popMenuNombresLOJA,'Callback',@CallBackpopMenuNombresLOJA);
            function CallBackpopMenuNombresLOJA(source2,eventdata)

                valor= get(source2,'Value');
                posicionFila = filasNombres(valor);
                banda=Tabla{posicionFila,columnaBanda};
                banda = substring(banda,0,2);
                bd = str2double(banda);
                switch bd
                    case 240
                        fmin = 2400;
                        fmax = 2483.5;
                    case 515
                        fmin = 5150;
                        fmax = 5250;
                    case 525
                        fmin = 5250;
                        fmax = 5350;
                    case 547
                        fmin = 5470;
                        fmax = 5725;
                    case 572
                        fmin = 5725;
                        fmax = 5850;
                end
                               
                %Remarcar las Figuras
                cla;
                %Barras ANCHO BANDA
                hold on;
                y=[1 1 1 1 1];
                x_l=[2400 5150 5250 5470 5725];
                x_u=[2483.5 5250 5350 5725 5850];
                for z=1:length(y)
                    patch([x_l(z) x_l(z) x_u(z) x_u(z)],[0 y(z) y(z) 0],'b');
                end
                y=[1];
                x_l=[fmin];
                x_u=[fmax];
                for z=1:length(y)
                    patch([x_l(z) x_l(z) x_u(z) x_u(z)],[0 y(z) y(z) 0],'r');
                end
                hold off;
                xlabel('Frecuencia [MHz]');
                ylabel('Potencia [W]');
                grid on;
                
                %Mostrar Datos de Consesionaria
                tablaConcesionarios =  uicontrol(handles.PanelPantalla,...
                    'Tag','tboxNombres',...
                    'style','listbox',...
                    'units','normalized',...
                    'HorizontalAlignment','center',...
                    'fontsize',10,...
                    'position',[ 0.795 0.02 0.2 0.74],...
                    'backgroundcolor',[0.941 0.941 0.941]);
                
                
                contador = 1;
                datos = cell(2*columnas,1);
                for z = 1 :columnas
                    if isa(Tabla{posicionFila,z},'double') ==1
                        aux = num2str( Tabla{posicionFila,z});
                    else
                        aux = Tabla{posicionFila,z};
                    end
                    datos(contador)= strcat(Tabla(1,z),': ',aux);
                    contador=contador+2;
                end
                set(tablaConcesionarios,'string',datos());

            end 

        end



        %ZAMORA CHINCHIPE
        ZAMORACHINCHIPE = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.54 0.12 0.04],...
            'string','ZAMORA CHINCHIPE',...
            'Tag','ZAMORACHINCHIPE',...
            'backgroundcolor',[0.941 0.941 0.941]);

        %CALLBACK Radio Button ZAMORA CHINCHIPE
        set(ZAMORACHINCHIPE,'Callback',@CallBackZAMORACHINCHIPE);
        function CallBackZAMORACHINCHIPE(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',0);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',1);
            set(MORONASANTIAGO,'Value',0);

            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end

            %Crear Lista Consecionarios
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'PROVINCIA A')==1)
                    columnaProvincia= j;
                end
                if(strcmp( Tabla(1,j ),'NOMBRES')==1)
                    columnaConcesionarios = j;
                end
                if(strcmp( Tabla(1,j ),'BANDA OPERACI�N')==1)
                    columnaBanda = j;
                end
            end
            cont=0;
            nombre= repmat({''},1,filas);
            filasNombres=zeros(1,filas);
            for k= 2:filas       
                prov= Tabla{k,columnaProvincia};
                nomb= Tabla(k,columnaConcesionarios);
                if findstr(prov,'ZAMORA CHINCHIPE')>0;
                    cont = cont+1;
                    nombre(cont)= nomb;
                    filasNombres(cont)= k;
                end
            end
            nombre = nombre(1:cont);
            filasNombres = filasNombres(1:cont);
            
            %Barras ANCHO BANDA
            EspFrecZAMORACHINCHIPEMDBA = axes('Units','pixels',...
                'Position',[300,50,600,400],...
                'Tag','EspFrecZAMORACHINCHIPEMDBA');
            y=[1 1 1 1 1 1];
            x_l=[2400 5150 5250 5470 5725 902];
            x_u=[2483.5 5250 5350 5725 5850 928];
            for z=1:length(y)
                patch([x_l(z) x_l(z) x_u(z) x_u(z)],[0 y(z) y(z) 0],'b');
            end
            xlabel('Frecuencia [MHz]');
            ylabel('Potencia [W]');
            grid on;

            %Texto ESPECTRO DE FRECUENCIAS TX
            espFrecuenciasZAMORACHINCHIPEMDBA = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.32 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS',...
                'backgroundcolor',[0.941 0.941 0.941]);        


            %Texto Nombres 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.85 0.81 0.1 0.04],...
                'string','Nombres:',...
                'backgroundcolor',[0.941 0.941 0.941]);

             %PopMenu Nombres
             popMenuNombresZAMORACHINCHIPE =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',nombre(:),...
                'position',[ 0.81 0.75 0.17 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);

            %CALLBACK Pop Menu Nombre
            set(popMenuNombresZAMORACHINCHIPE,'Callback',@CallBackpopMenuNombresZAMORACHINCHIPE);
            function CallBackpopMenuNombresZAMORACHINCHIPE(source2,eventdata)

                valor= get(source2,'Value');
                posicionFila = filasNombres(valor);
                banda=Tabla{posicionFila,columnaBanda};
                banda = substring(banda,0,2);
                bd = str2double(banda);
                switch bd
                    case 240
                        fmin = 2400;
                        fmax = 2483.5;
                    case 515
                        fmin = 5150;
                        fmax = 5250;
                    case 525
                        fmin = 5250;
                        fmax = 5350;
                    case 547
                        fmin = 5470;
                        fmax = 5725;
                    case 572
                        fmin = 5725;
                        fmax = 5850;
                    case 902
                        fmin = 902;
                        fmax = 928;
                end
                               
                %Remarcar las Figuras
                cla;
                %Barras ANCHO BANDA
                hold on;
                y=[1 1 1 1 1 1];
                x_l=[2400 5150 5250 5470 5725 902];
                x_u=[2483.5 5250 5350 5725 5850 928];
                for z=1:length(y)
                    patch([x_l(z) x_l(z) x_u(z) x_u(z)],[0 y(z) y(z) 0],'b');
                end
                y=[1];
                x_l=[fmin];
                x_u=[fmax];
                for z=1:length(y)
                    patch([x_l(z) x_l(z) x_u(z) x_u(z)],[0 y(z) y(z) 0],'r');
                end
                hold off;
                xlabel('Frecuencia [MHz]');
                ylabel('Potencia [W]');
                grid on;
                
                %Mostrar Datos de Consesionaria
                tablaConcesionarios =  uicontrol(handles.PanelPantalla,...
                    'Tag','tboxNombres',...
                    'style','listbox',...
                    'units','normalized',...
                    'HorizontalAlignment','center',...
                    'fontsize',10,...
                    'position',[ 0.795 0.02 0.2 0.74],...
                    'backgroundcolor',[0.941 0.941 0.941]);
                
                
                contador = 1;
                datos = cell(2*columnas,1);
                for z = 1 :columnas
                    if isa(Tabla{posicionFila,z},'double') ==1
                        aux = num2str( Tabla{posicionFila,z});
                    else
                        aux = Tabla{posicionFila,z};
                    end
                    datos(contador)= strcat(Tabla(1,z),': ',aux);
                    contador=contador+2;
                end
                set(tablaConcesionarios,'string',datos());

            end 

        end

        %MORONA SANTIAGO
        MORONASANTIAGO = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.46 0.13 0.04],...
            'string','MORONA SANTIAGO',...
            'Tag','MORONASANTIAGO',...
            'backgroundcolor',[0.941 0.941 0.941]);

        %CALLBACK Radio Button MORONA SANTIAGO
        set(MORONASANTIAGO,'Callback',@CallBackMORONASANTIAGO);
        function CallBackMORONASANTIAGO(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',0);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',1);

            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end

                        %Crear Lista Consecionarios
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'PROVINCIA A')==1)
                    columnaProvincia= j;
                end
                if(strcmp( Tabla(1,j ),'NOMBRES')==1)
                    columnaConcesionarios = j;
                end
                if(strcmp( Tabla(1,j ),'BANDA OPERACI�N')==1)
                    columnaBanda = j;
                end
            end
            cont=0;
            nombre= repmat({''},1,filas);
            filasNombres=zeros(1,filas);
            for k= 2:filas       
                prov= Tabla{k,columnaProvincia};
                nomb= Tabla(k,columnaConcesionarios);
                if findstr(prov,'MORONA SANTIAGO')>0;
                    cont = cont+1;
                    nombre(cont)= nomb;
                    filasNombres(cont)= k;
                end
            end
            nombre = nombre(1:cont);
            filasNombres = filasNombres(1:cont);
            
            %Barras ANCHO BANDA
            EspFrecMORONASANTIAGODBA = axes('Units','pixels',...
                'Position',[300,50,600,400],...
                'Tag','EspFrecMORONASANTIAGOMDBA');
            y=[1 1 1 1 1];
            x_l=[2400 5150 5250 5470 5725];
            x_u=[2483.5 5250 5350 5725 5850];
            for z=1:length(y)
                patch([x_l(z) x_l(z) x_u(z) x_u(z)],[0 y(z) y(z) 0],'b');
            end
            xlabel('Frecuencia [MHz]');
            ylabel('Potencia [W]');
            grid on;

            %Texto ESPECTRO DE FRECUENCIAS TX
            espFrecuenciasMORONASANTIAGOMDBA = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',16,...
                'position',[ 0.32 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS',...
                'backgroundcolor',[0.941 0.941 0.941]);        


            %Texto Nombres 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.85 0.81 0.1 0.04],...
                'string','Nombres:',...
                'backgroundcolor',[0.941 0.941 0.941]);

             %PopMenu Nombres
             popMenuNombresMORONASANTIAGO =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',nombre(:),...
                'position',[ 0.81 0.75 0.17 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);

            %CALLBACK Pop Menu Nombre
            set(popMenuNombresMORONASANTIAGO,'Callback',@CallBackpopMenuNombresMORONASANTIAGO);
            function CallBackpopMenuNombresMORONASANTIAGO(source2,eventdata)

                valor= get(source2,'Value');
                posicionFila = filasNombres(valor);
                banda=Tabla{posicionFila,columnaBanda};
                banda = substring(banda,0,2);
                bd = str2double(banda);
                switch bd
                    case 240
                        fmin = 2400;
                        fmax = 2483.5;
                    case 515
                        fmin = 5150;
                        fmax = 5250;
                    case 525
                        fmin = 5250;
                        fmax = 5350;
                    case 547
                        fmin = 5470;
                        fmax = 5725;
                    case 572
                        fmin = 5725;
                        fmax = 5850;
                end
                               
                %Remarcar las Figuras
                cla;
                %Barras ANCHO BANDA
                hold on;
                y=[1 1 1 1 1];
                x_l=[2400 5150 5250 5470 5725];
                x_u=[2483.5 5250 5350 5725 5850];
                for z=1:length(y)
                    patch([x_l(z) x_l(z) x_u(z) x_u(z)],[0 y(z) y(z) 0],'b');
                end
                y=[1];
                x_l=[fmin];
                x_u=[fmax];
                for z=1:length(y)
                    patch([x_l(z) x_l(z) x_u(z) x_u(z)],[0 y(z) y(z) 0],'r');
                end
                hold off;
                xlabel('Frecuencia [MHz]');
                ylabel('Potencia [W]');
                grid on;
                
                %Mostrar Datos de Consesionaria
                tablaConcesionarios =  uicontrol(handles.PanelPantalla,...
                    'Tag','tboxNombres',...
                    'style','listbox',...
                    'units','normalized',...
                    'HorizontalAlignment','center',...
                    'fontsize',10,...
                    'position',[ 0.795 0.02 0.2 0.74],...
                    'backgroundcolor',[0.941 0.941 0.941]);
                
                
                contador = 1;
                datos = cell(2*columnas,1);
                for z = 1 :columnas
                    if isa(Tabla{posicionFila,z},'double') ==1
                        aux = num2str( Tabla{posicionFila,z});
                    else
                        aux = Tabla{posicionFila,z};
                    end
                    datos(contador)= strcat(Tabla(1,z),': ',aux);
                    contador=contador+2;
                end
                set(tablaConcesionarios,'string',datos());

            end 


        end



    end


    
    AUXILIARES = uicontrol(handles.PanelPantalla,...
        'style','radiobutton',...
        'units','normalized',...
        'fontsize',12,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.84 0.92 0.1 0.045],...
        'string','AUXILIARES',...
        'Tag','RB7',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %CALLBACK Radio Button AUXILIARES
    set(AUXILIARES,'Callback',@CallBackAuxiliares);
    function CallBackAuxiliares(source,eventdata)
        
        %Seleccion de la Tabla VHFUHF 
        Tabla = TablaAuxiliares;
        [filas columnas] = size(Tabla);
        
        %Poner los demas radioButtons como deseleccionados
        set(SIRATV,'Value',0);
        set(SCDMA,'Value',0);
        set(FWA,'Value',0);
        set(ENLACES,'Value',0);
        set(VHFUHF,'Value',0);
        set(MDBA,'Value',0);
        set(AUXILIARES,'Value',1);
        
        %BORRAR TODO DE LA PANTALLA
        HandlePanelPantalla = get(handles.PanelPantalla);
        for k = 1:length(HandlePanelPantalla.Children)
            child = get(HandlePanelPantalla.Children(k));
            tag = child.Tag;            
            switch tag
                case 'RB1'
                case 'RB2'
                case 'RB3'
                case 'RB4'
                case 'RB5'
                case 'RB6'
                case 'RB7'    
                otherwise
                    delete(HandlePanelPantalla.Children(k));
            end
        end
        HandleVentana = get(handles.figure1);
        for k = 1:length(HandleVentana.Children)
            child = get(HandleVentana.Children(k));
            tag = child.Tag;            
            switch tag
                case 'Enlaces'
                case 'EstacionesBase'
                case 'PanelPantalla'
                case 'uitoolbar3'
                case 'GrupoBaseDatos'
                otherwise
                    delete(HandleVentana.Children(k));
            end
        end
        
        
        %RADIO BUTTONS PARA SELECCIONAR CATEGORIA
        GrupoProvincias = uibuttongroup(...
            'visible','on',...
            'fontsize',10,...
            'FontName','Times New Roman',...
            'Position',[0.025 0.4 0.15 0.4],...
            'Title','PROVINCIAS',...
            'Tag', 'GrupoProvincias',...
            'backgroundcolor',[ 0.941 0.941 0.941]);
        
        %AZUAY        
        AZUAY = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.78 0.1 0.04],...
            'string','AZUAY',...
            'Tag','AZUAY',...
            'backgroundcolor',[0.941 0.941 0.941]);        
                 
        %CALLBACK Radio Button AZUAY
        set(AZUAY,'Callback',@CallBackAZUAY);
        function CallBackAZUAY(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',1);
            set(CANAR,'Value',0);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Graficar Espectro y Crear Lista Consecionarios
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'Frecuencia Tx')==1)
                    columnaFrecuencia = j;
                end
                if(strcmp( Tabla(1,j ),'Provincia')==1)
                    columnaProvincia = j;
                end
                if(strcmp( Tabla(1,j ),'Potencia Radiada')==1)
                    columnaPotencia = j;
                end
                if(strcmp( Tabla(1,j ),'Nombre Del Concesionario')==1)
                    columnaConcesionarios = j;
                end
            end
            cont=0;
            concesionario= repmat({''},1,filas);
            filasConcesionario=zeros(1,filas);
            vectorFrecuencias=zeros(1,filas);
            vectorPotencias=zeros(1,filas);
            for k= 2:filas       
                frec = Tabla{k,columnaFrecuencia};
                prov= Tabla(k,columnaProvincia);
                pot= Tabla{k,columnaPotencia};
                conse= Tabla(k,columnaConcesionarios);
                cond = 0;
                if((pot=='-'))
                    cond=1; 
                end
                if(frec=='-')
                	cond=1;
                end
                if (strcmp(prov,'AZUAY')==1)&&(cond==0)
                    cont = cont+1;
                    if isa(frec,'double') ==1
                        vectorFrecuencias(cont)=frec;
                    else
                        vectorFrecuencias(cont)=conversionDecimal(frec);
                    end
                    
                    if isa(pot,'double') ==1
                        vectorPotencias(cont)=pot;
                    else
                        vectorPotencias(cont)=conversionDecimal(pot);
                    end
                    vectorPotencias(cont) = vectorPotencias(cont)/1000;
                    concesionario(cont)= conse;
                    filasConcesionario(cont)= k;
                end
            end
            concesionario = concesionario(1:cont);
            filasConcesionario = filasConcesionario(1:cont);
            vectorFrecuencias=vectorFrecuencias(1:cont);
            vectorPotencias=vectorPotencias(1:cont);
            
            %Texto ESPECTRO DE FRECUENCIAS
            espFrecuenciasAM = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.35 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA
            FigEspAZUAY= axes('Units','pixels','Position',[350,50,600,400],'Tag','FigEspAZUAY');
            stem(vectorFrecuencias,vectorPotencias,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [Hz]');
            ylabel('Potencia [W]');
            grid on;

            %Texto Consesionarios 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.85 0.81 0.11 0.04],...
                'string','Concesionarios:',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
             %PopMenu Consesionarios
             popMenuConcesionariosAZUAY =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',concesionario(:),...
                'position',[ 0.81 0.76 0.2 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);         
            
            %CALLBACK Pop Menu Concesionarios
            set(popMenuConcesionariosAZUAY,'Callback',@CallBackpopMenuConcesionariosAZUAY);
            function CallBackpopMenuConcesionariosAZUAY(source2,eventdata)
                %Mostrar Datos de Consesionaria
                tablaConcesionarios =  uicontrol(handles.PanelPantalla,...
                    'Tag','tboxNombres',...
                    'style','listbox',...
                    'units','normalized',...
                    'HorizontalAlignment','center',...
                    'fontsize',10,...
                    'position',[ 0.82 0.02 0.18 0.75],...
                    'backgroundcolor',[0.941 0.941 0.941]);
                
                valor= get(source2,'Value');
                
                posicionFila = filasConcesionario(valor);
                %Remarcar En la Figura
                cla
                fc = Tabla{posicionFila,columnaFrecuencia};
                pt = Tabla{posicionFila,columnaPotencia};
                if isa(fc,'double') ==1
                    frec=fc; 
                else
                    frec=conversionDecimal(fc);
                end

                if isa(pt,'double') ==1
                    pot=pt;
                else
                    pot=conversionDecimal(pt);
                end
                pot=pot/1000;
                
                stem(vectorFrecuencias,vectorPotencias,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2= stem(frec,pot,...
                    'LineStyle','-',...
                    'Color','red',...
                    'MarkerFaceColor','red',...
                    'MarkerEdgeColor','y',...
                    'Marker','o',...
                    'LineWidth',1.8);
                hold off;
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                grid on;
               
                contador = 1;
                datos = cell(2*columnas,1);
                for z = 1 :columnas
                    if isa(Tabla{posicionFila,z},'double') ==1
                        aux = num2str( Tabla{posicionFila,z});
                    else
                        aux = Tabla{posicionFila,z};
                    end
                    datos(contador)= strcat(Tabla(1,z),': ',aux);
                    contador=contador+2;
                end
                set(tablaConcesionarios,'string',datos());
            end 

        end
        
        %CA�AR
        CANAR = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.7 0.1 0.04],...
            'string','CA�AR',...
            'Tag','CANAR',...
            'backgroundcolor',[0.941 0.941 0.941]);

        %CALLBACK Radio Button CANAR
        set(CANAR,'Callback',@CallBackCANAR);
        function CallBackCANAR(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',1);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Graficar Espectro y Crear Lista Consecionarios
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'Frecuencia Tx')==1)
                    columnaFrecuencia = j;
                end
                if(strcmp( Tabla(1,j ),'Provincia')==1)
                    columnaProvincia = j;
                end
                if(strcmp( Tabla(1,j ),'Potencia Radiada')==1)
                    columnaPotencia = j;
                end
                if(strcmp( Tabla(1,j ),'Nombre Del Concesionario')==1)
                    columnaConcesionarios = j;
                end
            end
            cont=0;
            concesionario= repmat({''},1,filas);
            filasConcesionario=zeros(1,filas);
            vectorFrecuencias=zeros(1,filas);
            vectorPotencias=zeros(1,filas);
            for k= 2:filas       
                frec = Tabla{k,columnaFrecuencia};
                prov= Tabla(k,columnaProvincia);
                pot= Tabla{k,columnaPotencia};
                conse= Tabla(k,columnaConcesionarios);
                cond = 0;
                if((pot=='-'))
                    cond=1; 
                end
                if(frec=='-')
                	cond=1;
                end
                if (strcmp(prov,'CA�AR')==1)&&(cond==0)
                    cont = cont+1;
                    if isa(frec,'double') ==1
                        vectorFrecuencias(cont)=frec;
                    else
                        vectorFrecuencias(cont)=conversionDecimal(frec);
                    end
                    
                    if isa(pot,'double') ==1
                        vectorPotencias(cont)=pot;
                    else
                        vectorPotencias(cont)=conversionDecimal(pot);
                    end
                    vectorPotencias(cont) = vectorPotencias(cont)/1000;
                    concesionario(cont)= conse;
                    filasConcesionario(cont)= k;
                end
            end
            concesionario = concesionario(1:cont);
            filasConcesionario = filasConcesionario(1:cont);
            vectorFrecuencias=vectorFrecuencias(1:cont);
            vectorPotencias=vectorPotencias(1:cont);
            
            %Texto ESPECTRO DE FRECUENCIAS
            espFrecuenciasCANAR = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.35 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA
            FigEspCANAR= axes('Units','pixels','Position',[350,50,600,400],'Tag','FigEspCANAR');
            stem(vectorFrecuencias,vectorPotencias,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [Hz]');
            ylabel('Potencia [W]');
            grid on;

            %Texto Consesionarios 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.85 0.81 0.11 0.04],...
                'string','Concesionarios:',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
             %PopMenu Consesionarios
             popMenuConcesionariosCANAR =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',concesionario(:),...
                'position',[ 0.81 0.76 0.2 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);         
            
            %CALLBACK Pop Menu Concesionarios
            set(popMenuConcesionariosCANAR,'Callback',@CallBackpopMenuConcesionariosCANAR);
            function CallBackpopMenuConcesionariosCANAR(source2,eventdata)
                %Mostrar Datos de Consesionaria
                tablaConcesionarios =  uicontrol(handles.PanelPantalla,...
                    'Tag','tboxNombres',...
                    'style','listbox',...
                    'units','normalized',...
                    'HorizontalAlignment','center',...
                    'fontsize',10,...
                    'position',[ 0.82 0.02 0.18 0.75],...
                    'backgroundcolor',[0.941 0.941 0.941]);
                
                valor= get(source2,'Value');
                
                posicionFila = filasConcesionario(valor);
                %Remarcar En la Figura
                cla
                fc = Tabla{posicionFila,columnaFrecuencia};
                pt = Tabla{posicionFila,columnaPotencia};
                if isa(fc,'double') ==1
                    frec=fc; 
                else
                    frec=conversionDecimal(fc);
                end

                if isa(pt,'double') ==1
                    pot=pt;
                else
                    pot=conversionDecimal(pt);
                end
                pot=pot/1000;
                
                stem(vectorFrecuencias,vectorPotencias,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2= stem(frec,pot,...
                    'LineStyle','-',...
                    'Color','red',...
                    'MarkerFaceColor','red',...
                    'MarkerEdgeColor','y',...
                    'Marker','o',...
                    'LineWidth',1.8);
                hold off;
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                grid on;
               
                contador = 1;
                datos = cell(2*columnas,1);
                for z = 1 :columnas
                    if isa(Tabla{posicionFila,z},'double') ==1
                        aux = num2str( Tabla{posicionFila,z});
                    else
                        aux = Tabla{posicionFila,z};
                    end
                    datos(contador)= strcat(Tabla(1,z),': ',aux);
                    contador=contador+2;
                end
                set(tablaConcesionarios,'string',datos());
            end 

        end
        

        %LOJA
        LOJA = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.62 0.1 0.04],...
            'string','LOJA',...
            'Tag','LOJA',...
            'backgroundcolor',[0.941 0.941 0.941]);        
       
        %CALLBACK Radio Button LOJA
        set(LOJA,'Callback',@CallBackLOJA);
        function CallBackLOJA(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',0);
            set(LOJA,'Value',1);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Graficar Espectro y Crear Lista Consecionarios
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'Frecuencia Tx')==1)
                    columnaFrecuencia = j;
                end
                if(strcmp( Tabla(1,j ),'Provincia')==1)
                    columnaProvincia = j;
                end
                if(strcmp( Tabla(1,j ),'Potencia Radiada')==1)
                    columnaPotencia = j;
                end
                if(strcmp( Tabla(1,j ),'Nombre Del Concesionario')==1)
                    columnaConcesionarios = j;
                end
            end
            cont=0;
            concesionario= repmat({''},1,filas);
            filasConcesionario=zeros(1,filas);
            vectorFrecuencias=zeros(1,filas);
            vectorPotencias=zeros(1,filas);
            for k= 2:filas       
                frec = Tabla{k,columnaFrecuencia};
                prov= Tabla(k,columnaProvincia);
                pot= Tabla{k,columnaPotencia};
                conse= Tabla(k,columnaConcesionarios);
                cond = 0;
                if((pot=='-'))
                    cond=1; 
                end
                if(frec=='-')
                	cond=1;
                end
                if (strcmp(prov,'LOJA')==1)&&(cond==0)
                    cont = cont+1;
                    if isa(frec,'double') ==1
                        vectorFrecuencias(cont)=frec;
                    else
                        vectorFrecuencias(cont)=conversionDecimal(frec);
                    end
                    
                    if isa(pot,'double') ==1
                        vectorPotencias(cont)=pot;
                    else
                        vectorPotencias(cont)=conversionDecimal(pot);
                    end
                    vectorPotencias(cont) = vectorPotencias(cont)/1000;
                    concesionario(cont)= conse;
                    filasConcesionario(cont)= k;
                end
            end
            concesionario = concesionario(1:cont);
            filasConcesionario = filasConcesionario(1:cont);
            vectorFrecuencias=vectorFrecuencias(1:cont);
            vectorPotencias=vectorPotencias(1:cont);
            
            %Texto ESPECTRO DE FRECUENCIAS
            espFrecuenciasCANAR = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.35 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA
            FigEspLOJA= axes('Units','pixels','Position',[350,50,600,400],'Tag','FigEspCANAR');
            stem(vectorFrecuencias,vectorPotencias,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [Hz]');
            ylabel('Potencia [W]');
            grid on;

            %Texto Consesionarios 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.85 0.81 0.11 0.04],...
                'string','Concesionarios:',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
             %PopMenu Consesionarios
             popMenuConcesionariosLOJA =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',concesionario(:),...
                'position',[ 0.81 0.76 0.2 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);         
            
            %CALLBACK Pop Menu Concesionarios
            set(popMenuConcesionariosLOJA,'Callback',@CallBackpopMenuConcesionariosLOJA);
            function CallBackpopMenuConcesionariosLOJA(source2,eventdata)
                %Mostrar Datos de Consesionaria
                tablaConcesionarios =  uicontrol(handles.PanelPantalla,...
                    'Tag','tboxNombres',...
                    'style','listbox',...
                    'units','normalized',...
                    'HorizontalAlignment','center',...
                    'fontsize',10,...
                    'position',[ 0.82 0.02 0.18 0.75],...
                    'backgroundcolor',[0.941 0.941 0.941]);
                
                valor= get(source2,'Value');
                
                posicionFila = filasConcesionario(valor);
                %Remarcar En la Figura
                cla
                fc = Tabla{posicionFila,columnaFrecuencia};
                pt = Tabla{posicionFila,columnaPotencia};
                if isa(fc,'double') ==1
                    frec=fc; 
                else
                    frec=conversionDecimal(fc);
                end

                if isa(pt,'double') ==1
                    pot=pt;
                else
                    pot=conversionDecimal(pt);
                end
                pot=pot/1000;
                
                stem(vectorFrecuencias,vectorPotencias,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2= stem(frec,pot,...
                    'LineStyle','-',...
                    'Color','red',...
                    'MarkerFaceColor','red',...
                    'MarkerEdgeColor','y',...
                    'Marker','o',...
                    'LineWidth',1.8);
                hold off;
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                grid on;
               
                contador = 1;
                datos = cell(2*columnas,1);
                for z = 1 :columnas
                    if isa(Tabla{posicionFila,z},'double') ==1
                        aux = num2str( Tabla{posicionFila,z});
                    else
                        aux = Tabla{posicionFila,z};
                    end
                    datos(contador)= strcat(Tabla(1,z),': ',aux);
                    contador=contador+2;
                end
                set(tablaConcesionarios,'string',datos());
            end 

        end
        
             
        
        %ZAMORA CHINCHIPE
        ZAMORACHINCHIPE = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.54 0.12 0.04],...
            'string','ZAMORA CHINCHIPE',...
            'Tag','ZAMORACHINCHIPE',...
            'backgroundcolor',[0.941 0.941 0.941]);
        
        %CALLBACK Radio Button ZAMORA CHINCHIPE
        set(ZAMORACHINCHIPE,'Callback',@CallBackZAMORACHINCHIPE);
        function CallBackZAMORACHINCHIPE(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',0);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',1);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Graficar Espectro y Crear Lista Consecionarios
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'Frecuencia Tx')==1)
                    columnaFrecuencia = j;
                end
                if(strcmp( Tabla(1,j ),'Provincia')==1)
                    columnaProvincia = j;
                end
                if(strcmp( Tabla(1,j ),'Potencia Radiada')==1)
                    columnaPotencia = j;
                end
                if(strcmp( Tabla(1,j ),'Nombre Del Concesionario')==1)
                    columnaConcesionarios = j;
                end
            end
            cont=0;
            concesionario= repmat({''},1,filas);
            filasConcesionario=zeros(1,filas);
            vectorFrecuencias=zeros(1,filas);
            vectorPotencias=zeros(1,filas);
            for k= 2:filas       
                frec = Tabla{k,columnaFrecuencia};
                prov= Tabla(k,columnaProvincia);
                pot= Tabla{k,columnaPotencia};
                conse= Tabla(k,columnaConcesionarios);
                cond = 0;
                if((pot=='-'))
                    cond=1; 
                end
                if(frec=='-')
                	cond=1;
                end
                if (strcmp(prov,'ZAMORA CHINCHIPE')==1)&&(cond==0)
                    cont = cont+1;
                    if isa(frec,'double') ==1
                        vectorFrecuencias(cont)=frec;
                    else
                        vectorFrecuencias(cont)=conversionDecimal(frec);
                    end
                    
                    if isa(pot,'double') ==1
                        vectorPotencias(cont)=pot;
                    else
                        vectorPotencias(cont)=conversionDecimal(pot);
                    end
                    vectorPotencias(cont) = vectorPotencias(cont)/1000;
                    concesionario(cont)= conse;
                    filasConcesionario(cont)= k;
                end
            end
            concesionario = concesionario(1:cont);
            filasConcesionario = filasConcesionario(1:cont);
            vectorFrecuencias=vectorFrecuencias(1:cont);
            vectorPotencias=vectorPotencias(1:cont);
            
            %Texto ESPECTRO DE FRECUENCIAS
            espFrecuenciasZAMORA = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.35 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA
            FigEspLOJA= axes('Units','pixels','Position',[350,50,600,400],'Tag','FigEspCANAR');
            stem(vectorFrecuencias,vectorPotencias,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [Hz]');
            ylabel('Potencia [W]');
            grid on;

            %Texto Consesionarios 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.85 0.81 0.11 0.04],...
                'string','Concesionarios:',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
             %PopMenu Consesionarios
             popMenuConcesionariosZAMORACHINCHIPE =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',concesionario(:),...
                'position',[ 0.81 0.76 0.2 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);         
            
            %CALLBACK Pop Menu Concesionarios
            set(popMenuConcesionariosZAMORACHINCHIPE,'Callback',@CallBackpopMenuConcesionariosZAMORACHINCHIPE);
            function CallBackpopMenuConcesionariosZAMORACHINCHIPE(source2,eventdata)
                %Mostrar Datos de Consesionaria
                tablaConcesionarios =  uicontrol(handles.PanelPantalla,...
                    'Tag','tboxNombres',...
                    'style','listbox',...
                    'units','normalized',...
                    'HorizontalAlignment','center',...
                    'fontsize',10,...
                    'position',[ 0.82 0.02 0.18 0.75],...
                    'backgroundcolor',[0.941 0.941 0.941]);
                
                valor= get(source2,'Value');
                
                posicionFila = filasConcesionario(valor);
                %Remarcar En la Figura
                cla
                fc = Tabla{posicionFila,columnaFrecuencia};
                pt = Tabla{posicionFila,columnaPotencia};
                if isa(fc,'double') ==1
                    frec=fc; 
                else
                    frec=conversionDecimal(fc);
                end

                if isa(pt,'double') ==1
                    pot=pt;
                else
                    pot=conversionDecimal(pt);
                end
                pot=pot/1000;
                
                stem(vectorFrecuencias,vectorPotencias,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2= stem(frec,pot,...
                    'LineStyle','-',...
                    'Color','red',...
                    'MarkerFaceColor','red',...
                    'MarkerEdgeColor','y',...
                    'Marker','o',...
                    'LineWidth',1.8);
                hold off;
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                grid on;
               
                contador = 1;
                datos = cell(2*columnas,1);
                for z = 1 :columnas
                    if isa(Tabla{posicionFila,z},'double') ==1
                        aux = num2str( Tabla{posicionFila,z});
                    else
                        aux = Tabla{posicionFila,z};
                    end
                    datos(contador)= strcat(Tabla(1,z),': ',aux);
                    contador=contador+2;
                end
                set(tablaConcesionarios,'string',datos());
            end 

        end
        
        %MORONA SANTIAGO
        MORONASANTIAGO = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.46 0.13 0.04],...
            'string','MORONA SANTIAGO',...
            'Tag','MORONASANTIAGO',...
            'backgroundcolor',[0.941 0.941 0.941]);

        %CALLBACK Radio Button MORONA SANTIAGO
        set(MORONASANTIAGO,'Callback',@CallBackMORONASANTIAGO);
        function CallBackMORONASANTIAGO(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',0);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',1);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Graficar Espectro y Crear Lista Consecionarios
            for j= 1:columnas
                if(strcmp( Tabla(1,j ),'Frecuencia Tx')==1)
                    columnaFrecuencia = j;
                end
                if(strcmp( Tabla(1,j ),'Provincia')==1)
                    columnaProvincia = j;
                end
                if(strcmp( Tabla(1,j ),'Potencia Radiada')==1)
                    columnaPotencia = j;
                end
                if(strcmp( Tabla(1,j ),'Nombre Del Concesionario')==1)
                    columnaConcesionarios = j;
                end
            end
            cont=0;
            concesionario= repmat({''},1,filas);
            filasConcesionario=zeros(1,filas);
            vectorFrecuencias=zeros(1,filas);
            vectorPotencias=zeros(1,filas);
            for k= 2:filas       
                frec = Tabla{k,columnaFrecuencia};
                prov= Tabla(k,columnaProvincia);
                pot= Tabla{k,columnaPotencia};
                conse= Tabla(k,columnaConcesionarios);
                cond = 0;
                if((pot=='-'))
                    cond=1; 
                end
                if(frec=='-')
                	cond=1;
                end
                if (strcmp(prov,'MORONA SANTIAGO')==1)&&(cond==0)
                    cont = cont+1;
                    if isa(frec,'double') ==1
                        vectorFrecuencias(cont)=frec;
                    else
                        vectorFrecuencias(cont)=conversionDecimal(frec);
                    end
                    
                    if isa(pot,'double') ==1
                        vectorPotencias(cont)=pot;
                    else
                        vectorPotencias(cont)=conversionDecimal(pot);
                    end
                    vectorPotencias(cont) = vectorPotencias(cont)/1000;
                    concesionario(cont)= conse;
                    filasConcesionario(cont)= k;
                end
            end
            concesionario = concesionario(1:cont);
            filasConcesionario = filasConcesionario(1:cont);
            vectorFrecuencias=vectorFrecuencias(1:cont);
            vectorPotencias=vectorPotencias(1:cont);
            
            %Texto ESPECTRO DE FRECUENCIAS
            espFrecuenciasMORONASANTIAGO = uicontrol(handles.PanelPantalla,...
                'Tag','categoriaAM',...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.35 0.81 0.35 0.05],...
                'string','ESPECTRO DE FRECUENCIAS',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
            %Figura ESPECTRO FRECUENCIA
            FigEspLOJA= axes('Units','pixels','Position',[350,50,600,400],'Tag','FigEspCANAR');
            stem(vectorFrecuencias,vectorPotencias,...
                'LineStyle','-',...
                'MarkerFaceColor','blue',...
                'MarkerEdgeColor','green',...
                'Marker','o',...
                'LineWidth',1.5);
            xlabel('Frecuencia [Hz]');
            ylabel('Potencia [W]');
            grid on;

            %Texto Consesionarios 
            txtConcesionarios = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'units','normalized',...
                'fontsize',12,...
                'fontWeight','bold',...
                'FontName', 'Times New Roman',...
                'HorizontalAlignment','left',...
                'position',[ 0.85 0.81 0.11 0.04],...
                'string','Concesionarios:',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
             %PopMenu Consesionarios
             popMenuConcesionariosMORONASANTIAGO =  uicontrol(handles.PanelPantalla,...
                'Tag','popConsesionarios',...
                'style','popupmenu',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',8,...
                'string',concesionario(:),...
                'position',[ 0.81 0.76 0.2 0.06],...
                'backgroundcolor',[0.941 0.941 0.941]);         
            
            %CALLBACK Pop Menu Concesionarios
            set(popMenuConcesionariosMORONASANTIAGO,'Callback',@CallBackpopMenuConcesionariosMORONASANTIAGO);
            function CallBackpopMenuConcesionariosMORONASANTIAGO(source2,eventdata)
                %Mostrar Datos de Consesionaria
                tablaConcesionarios =  uicontrol(handles.PanelPantalla,...
                    'Tag','tboxNombres',...
                    'style','listbox',...
                    'units','normalized',...
                    'HorizontalAlignment','center',...
                    'fontsize',10,...
                    'position',[ 0.82 0.02 0.18 0.75],...
                    'backgroundcolor',[0.941 0.941 0.941]);
                
                valor= get(source2,'Value');
                
                posicionFila = filasConcesionario(valor);
                %Remarcar En la Figura
                cla
                fc = Tabla{posicionFila,columnaFrecuencia};
                pt = Tabla{posicionFila,columnaPotencia};
                if isa(fc,'double') ==1
                    frec=fc; 
                else
                    frec=conversionDecimal(fc);
                end

                if isa(pt,'double') ==1
                    pot=pt;
                else
                    pot=conversionDecimal(pt);
                end
                pot=pot/1000;
                
                stem(vectorFrecuencias,vectorPotencias,...
                    'LineStyle','-',...
                    'MarkerFaceColor','blue',...
                    'MarkerEdgeColor','green',...
                    'Marker','o',...
                    'LineWidth',1.5);
                hold on;
                h2= stem(frec,pot,...
                    'LineStyle','-',...
                    'Color','red',...
                    'MarkerFaceColor','red',...
                    'MarkerEdgeColor','y',...
                    'Marker','o',...
                    'LineWidth',1.8);
                hold off;
                xlabel('Frecuencia [Hz]');
                ylabel('Potencia [W]');
                grid on;
               
                contador = 1;
                datos = cell(2*columnas,1);
                for z = 1 :columnas
                    if isa(Tabla{posicionFila,z},'double') ==1
                        aux = num2str( Tabla{posicionFila,z});
                    else
                        aux = Tabla{posicionFila,z};
                    end
                    datos(contador)= strcat(Tabla(1,z),': ',aux);
                    contador=contador+2;
                end
                set(tablaConcesionarios,'string',datos());
            end 
        end        

    end   
    
    
    BasesDeDatos = uibuttongroup(...
        'Tag','GrupoBaseDatos',...
        'visible','on',...
        'fontsize',10,...
        'FontName','Times New Roman',...
        'Position',[0.02 0.85 0.95 0.08],...
        'Title','BASES DE DATOS',...
        'backgroundcolor',[ 0.941 0.941 0.941]);
    


end    

% ENLACES DE CONCECIONARIOS DEL AUSTRO
function EnlacesAustro_Callback(hObject, eventdata, handles)
    
    %Borrar elementos de la interfaz y cambiar el titulo del Panel 
    HandlePanelPantalla = get(handles.PanelPantalla);
    HandleVentana = get(handles.figure1);
    set(handles.PanelPantalla,'Title','Enlaces Austro');
    delete(HandlePanelPantalla.Children);
    for k = 1:length(HandleVentana.Children)
        child = get(HandleVentana.Children(k));
        tag = child.Tag;            
        switch tag
            case 'Enlaces'
            case 'EstacionesBase'
            case 'PanelPantalla'
            case 'uitoolbar3'
            otherwise
                delete(HandleVentana.Children(k));
        end
    end

    
    %Variables Globales Tablas
    global TablaSiraTv TablaSCDMA450 TablaFWA TablaEnlaces TablaVHFUHF TablaMDBA TablaAuxiliares;

    %Crear Lista de Nombres
    [filasEnlaces columnasEnlaces] = size(TablaEnlaces);
    global nombres;
    nombres = repmat({''},1,filasEnlaces);
    contadorNombres=1;
    for j= 1:columnasEnlaces
        if(strcmp( TablaEnlaces(1,j ),'NOMBRES')==1)
            columnaNombres = j;
        end
    end
    for k= 2:filasEnlaces 
        bandera=1;
        for j = 1: contadorNombres   
            if(strcmp( TablaEnlaces(k,columnaNombres ),nombres(j))==1)
                bandera = 0;
                j = contadorNombres;   
            end
        end
        if bandera == 1
            nombres(contadorNombres)=TablaEnlaces(k,columnaNombres);
            contadorNombres=contadorNombres+1;
        end
    end
    nombres = nombres(1:contadorNombres-1);
 
    %Crear Lista de Direcciones
    global direcciones;
    direcciones = repmat({''},1,filasEnlaces);
    contadorDirecciones=1;
    for j= 1:columnasEnlaces
        if(strcmp( TablaEnlaces(1,j ),'DIRECCI�N')==1)
            columnaDirecciones = j;
        end
    end
    for k= 2:filasEnlaces 
        bandera=1;
        for j = 1: contadorNombres   
            if(strcmp( TablaEnlaces(k,columnaDirecciones ),direcciones(j))==1)
                bandera = 0;
                j = contadorDirecciones;   
            end
        end
        if bandera == 1
            direcciones(contadorDirecciones)=TablaEnlaces(k,columnaDirecciones);
            contadorDirecciones=contadorDirecciones+1;
        end
    end
    direcciones = direcciones(1:contadorDirecciones-1);

    
    %TRANSMISOR
    
    %Grupo de Datos TX
    DatosTransmisor = uibuttongroup(...
        'visible','on',...
        'fontsize',11,...
        'FontName','Times New Roman',...
        'Position',[0.001 0.01 0.315 0.92],...
        'Title','DATOS DE TRANSMISOR',...
        'TitlePosition', 'centertop',...
        'backgroundcolor',[ 0.941 0.941 0.941]);
    
    %Texto Longitud TX
    txtLongTx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtLongTx',...
        'style','text',...
        'units','normalized',...
        'fontWeight','bold',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[0.02 0.93 0.05 0.025],...
        'string','Longitud',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Longtud TX
    longitudTx =  uicontrol(handles.PanelPantalla,...
        'Tag','longitudTx',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[ 0.01 0.9 0.07 0.03]);
    
     %PopMenu Unidades Longitud
     un0={'E'; 'W'};
     popMenuUnidadesLongTx =  uicontrol(handles.PanelPantalla,...
        'Tag','popUnidadesLongTx',...
        'style','popupmenu',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',8,...
        'position',[ 0.08 0.905 0.03 0.03],...
        'string',un0(:),...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Texto Latitud TX
    txtLatTx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtLatTx',...
        'style','text',...
        'units','normalized',...
        'fontWeight','bold',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[  0.13 0.93 0.05 0.025],...
        'string','Latitud',...
        'backgroundcolor',[0.941 0.941 0.941 ]);
     
    %Edit Latitud TX
    latitudTx =  uicontrol(handles.PanelPantalla,...
        'Tag','latitudTx',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[ 0.12 0.9 0.07 0.03]);  
    
     %PopMenu Unidades Latitud
     un1={'N'; 'S'};
     popMenuUnidadesLatTx =  uicontrol(handles.PanelPantalla,...
        'Tag','popUnidadesLatTx',...
        'style','popupmenu',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',8,...
        'position',[ 0.19 0.905 0.03 0.03],...
        'string',un1(:),...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Texto Potencia TX
    txtPotTx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtPotTx',...
        'style','text',...
        'units','normalized',...
        'fontWeight','bold',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[  0.24 0.93 0.05 0.025],...
        'string','Potencia',...
        'backgroundcolor',[0.941 0.941 0.941 ]);
     
    %Edit Potencia TX
    potenciaTx =  uicontrol(handles.PanelPantalla,...
        'Tag','potenciaTx',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[ 0.235 0.9 0.04 0.03]);     
    
     %PopMenu Unidades Potencia
     un2={'W'; 'dBm'};
     popMenuUnidadesPotTx =  uicontrol(handles.PanelPantalla,...
        'Tag','popUnidadesPotTx',...
        'style','popupmenu',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',8,...
        'position',[ 0.275 0.905 0.04 0.025],...
        'string',un2(:),...
        'backgroundcolor',[0.941 0.941 0.941]);
    
     %Texto Ganancia TX
    txtGanTx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtGanTx',...
        'style','text',...
        'units','normalized',...
        'fontWeight','bold',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[  0.03 0.85 0.06 0.025],...
        'string','Ganancia',...
        'backgroundcolor',[0.941 0.941 0.941 ]);
     
    %Edit Ganancia TX
    gananciaTx =  uicontrol(handles.PanelPantalla,...
        'Tag','gananciaTx',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[ 0.02 0.81 0.04 0.03]);     
    
     %PopMenu Unidades Ganancia
     un3={'dBi'; 'dBd'; 'A'};
     popMenuUnidadesGanTx =  uicontrol(handles.PanelPantalla,...
        'Tag','popUnidadesGanTx',...
        'style','popupmenu',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',8,...
        'position',[ 0.06 0.815 0.04 0.03],...
        'string',un3(:),...
        'backgroundcolor',[0.941 0.941 0.941]);   
    
    %Texto Altura Estructura TX
    txtAltExtTx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtAltExtTx',...
        'style','text',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[  0.155 0.83 0.1 0.025],...
        'string','Altura Torre: ',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Altura Estructura TX
    alturaExtructuraTx =  uicontrol(handles.PanelPantalla,...
        'Tag','alturaExtructuraTx',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[ 0.24 0.83 0.04 0.025]);
    
    %Texto m
    txtm0Tx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtm0Tx',...
        'style','text',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[0.29 0.83 0.02 0.025],...
        'string','m',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Texto Altura Estacion TX
    txtAltEstTx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtAltEstTx',...
        'style','text',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[  0.148 0.8 0.1 0.025],...
        'string','Altura Estacion: ',...
        'backgroundcolor',[0.941 0.941 0.941 ]);
    
    %Edit Altura Estacion TX
    alturaEstacionTx =  uicontrol(handles.PanelPantalla,...
        'Tag','alturaEstacionTx',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[ 0.24 0.8 0.04 0.025]); 
    
    %Texto m
    txtm1Tx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtm1Tx',...
        'style','text',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[0.29 0.8 0.02 0.025],...
        'string','m',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Texto Altura TX
    txtAltTx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtAltTx',...
        'style','text',...
        'units','normalized',...
        'fontWeight','bold',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[  0.19 0.765 0.06 0.025],...
        'string','Altura: ',...
        'backgroundcolor',[0.941 0.941 0.941 ]);
     
    %Edit Altura Total TX
    alturaTx =  uicontrol(handles.PanelPantalla,...
        'Tag','gananciaTx',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[ 0.24 0.765 0.04 0.03]);     
    
    %Texto m
    txtm2Tx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtm2Tx',...
        'style','text',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[0.29 0.77 0.02 0.025],...
        'string','m',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Grupo Perdidas TX
    PerdidasTransmisor = uibuttongroup(...
        'visible','on',...
        'fontsize',10,...
        'FontName','Times New Roman',...
        'Position',[0.01 0.54 0.16 0.2],...
        'Title','PERDIDAS TX',...
        'TitlePosition', 'centertop',...
        'backgroundcolor',[ 0.941 0.941 0.941]);
  
     %Texto Perdidas TX
    txtPerdTx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtPerdTx',...
        'style','text',...
        'units','normalized',...
        'fontWeight','bold',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[0.015 0.725 0.06 0.025],...
        'string','Perdidas',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Perdidas TX
    perdidasTx =  uicontrol(handles.PanelPantalla,...
        'Tag','perdidasTx',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[ 0.09 0.72 0.05 0.03]);
    
    %Texto dB
    txtdBTx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtdBTx',...
        'style','text',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[0.14 0.725 0.02 0.025],...
        'string','dB',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Texto Perdidas Aleatorias TX
    txtPerdAleTx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtPerdAleTx',...
        'style','text',...
        'units','normalized',...
        'fontWeight','bold',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[0.012 0.665 0.06 0.05],...
        'string','Perdidas Aleatorias: ',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Perdidas Aleatorias TX
    perdidasAleatoriasTx =  uicontrol(handles.PanelPantalla,...
        'Tag','perdidasAleatoriasTx',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[ 0.09 0.67 0.05 0.03]);
    
    %Texto dB
    txtdB0Tx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtdB0Tx',...
        'style','text',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[0.14 0.675 0.02 0.025],...
        'string','dB',...
        'backgroundcolor',[0.941 0.941 0.941]);  
    
    %Texto Error TX
    txtErrTx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtErrTx',...
        'style','text',...
        'units','normalized',...
        'fontWeight','bold',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[0.01 0.62 0.06 0.025],...
        'string','Error De',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Texto Apuntamiento TX
    txtApuTx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtApuTx',...
        'style','text',...
        'units','normalized',...
        'fontWeight','bold',...
        'HorizontalAlignment','left',...
        'fontsize',10,...
        'position',[0.01 0.595 0.08 0.025],...
        'string','Apuntamiento',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Error Apuntamiento TX
    errorApuntamientoTx =  uicontrol(handles.PanelPantalla,...
        'Tag','perdidasTx',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[ 0.09 0.605 0.05 0.03]);
    
    %Texto dB
    txtdB1Tx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtdB1Tx',...
        'style','text',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[0.14 0.61 0.02 0.025],...
        'string','dB',...
        'backgroundcolor',[0.941 0.941 0.941]);    
    
    
    
%     %Texto Nombres TX
%     txtNombresTx = uicontrol(handles.PanelPantalla,...
%         'style','text',...
%         'units','normalized',...
%         'fontsize',11,...
%         'fontWeight','bold',...
%         'FontName', 'Times New Roman',...
%         'HorizontalAlignment','left',...
%         'position',[ 0.01 0.1 0.08 0.04],...
%         'string','Nombres:',...
%         'backgroundcolor',[0.941 0 0.941]);
%      
%      %PopMenu Nombres TX
%      popMenuNombresTx =  uicontrol(handles.PanelPantalla,...
%         'Tag','popNombres',...
%         'style','popupmenu',...
%         'units','normalized',...
%         'HorizontalAlignment','center',...
%         'fontsize',8,...
%         'position',[ 0.01 0.05 0.14 0.06],...
%         'string',nombres(:),...
%         'backgroundcolor',[0.941 1 0.941]);
%     
%     %CallBack PopMenu Nombres TX
%     set(popMenuNombresTx,'Callback',@Mostrar_Datos_Nombre);
%     function Mostrar_Datos_Nombre(source,eventdata)
%         
%         tablaNombres =  uicontrol(handles.PanelPantalla,...
%             'Tag','tboxNombres',...
%             'style','listbox',...
%             'units','normalized',...
%             'HorizontalAlignment','center',...
%             'fontsize',8,...
%             'position',[ 0.05 0.45 0.15 0.4],...
%             'backgroundcolor',[0.941 1 0.941]);
%         
%         posicionFila = get(source,'Value');
%         contador = 1;
%         datos = cell(2*columnasEnlaces,1);
%         %datos(:)={''};
%         %datos=Str.empty;
%         aux = '';
%         for z = 1 :columnasEnlaces
%             if isa(TablaEnlaces{posicionFila,z},'double') ==1
%                 aux = num2str( TablaEnlaces{posicionFila,z});
%             else
%                 aux = TablaEnlaces{posicionFila,z};
%             end
%             datos(contador)= strcat(TablaEnlaces(1,z),': ',aux);
%             contador=contador+2;
%         end
%         set(tablaNombres,'string',datos());
%     
%             %str = get(source,'String')
%         
%         %cojido = str(val);
%         %nombre = repmat({'redf'},1,10)
%         
%         %h = msgbox(cojido,'�Qu� tenemos?','help');
%     end
    

    %RECEPTOR
    
    %Grupo de Datos RX
    DatosReceptor = uibuttongroup(...
        'visible','on',...
        'fontsize',11,...
        'FontName','Times New Roman',...
        'Position',[0.685 0.01 0.315 0.92],...
        'Title','DATOS DE RECEPTOR',...
        'TitlePosition', 'centertop',...
        'backgroundcolor',[ 0.941 0.941 0.941]);  
    
    %Texto Longitud RX
    txtLongRx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtLongRx',...
        'style','text',...
        'units','normalized',...
        'fontWeight','bold',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[0.72 0.93 0.05 0.025],...
        'string','Longitud',...
        'backgroundcolor',[0.941 0.941 0.941]);
     
    %Edit Longtud RX
    longitudRx =  uicontrol(handles.PanelPantalla,...
        'Tag','longitudRx',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[ 0.71 0.9 0.07 0.03]);
    
     %PopMenu Unidades Longitud
     un4={'E'; 'W'};
     popMenuUnidadesLongRx =  uicontrol(handles.PanelPantalla,...
        'Tag','popUnidadesLongRx',...
        'style','popupmenu',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',8,...
        'position',[ 0.78 0.905 0.03 0.03],...
        'string',un4(:),...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Texto Latitud RX
    txtLatRx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtLatRx',...
        'style','text',...
        'units','normalized',...
        'fontWeight','bold',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[  0.83 0.93 0.05 0.025],...
        'string','Latitud',...
        'backgroundcolor',[0.941 0.941 0.941 ]);
     
    %Edit Latitud RX
    latitudRx =  uicontrol(handles.PanelPantalla,...
        'Tag','latitudRx',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[ 0.82 0.9 0.07 0.03]);  
    
     %PopMenu Unidades Latitud
     un5={'N'; 'S'};
     popMenuUnidadesLatRx =  uicontrol(handles.PanelPantalla,...
        'Tag','popUnidadesLatRx',...
        'style','popupmenu',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',8,...
        'position',[ 0.89 0.905 0.03 0.03],...
        'string',un5(:),...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Texto Potencia RX
    txtPotRx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtPotRx',...
        'style','text',...
        'units','normalized',...
        'fontWeight','bold',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[  0.93 0.93 0.05 0.025],...
        'string','Potencia',...
        'backgroundcolor',[0.941 0.941 0.941 ]);
     
    %Edit Potencia RX
    potenciaRx =  uicontrol(handles.PanelPantalla,...
        'Tag','potenciaRx',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[ 0.925 0.9 0.04 0.03]);     
    
     %PopMenu Unidades Potencia
     un6={'W'; 'dBm'};
     popMenuUnidadesPotRx =  uicontrol(handles.PanelPantalla,...
        'Tag','popUnidadesPotRx',...
        'style','popupmenu',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',8,...
        'position',[ 0.965 0.905 0.04 0.025],...
        'string',un6(:),...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Texto Ganancia RX
    txtGanRx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtGanRx',...
        'style','text',...
        'units','normalized',...
        'fontWeight','bold',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[  0.73 0.85 0.06 0.025],...
        'string','Ganancia',...
        'backgroundcolor',[0.941 0.941 0.941 ]);
     
    %Edit Ganancia RX
    gananciaRx =  uicontrol(handles.PanelPantalla,...
        'Tag','gananciaRx',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[ 0.72 0.81 0.04 0.03]);     
    
     %PopMenu Unidades Ganancia
     un7={'dBi'; 'dBd'; 'A'};
     popMenuUnidadesGanRx =  uicontrol(handles.PanelPantalla,...
        'Tag','popUnidadesGanRx',...
        'style','popupmenu',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',8,...
        'position',[ 0.76 0.815 0.04 0.03],...
        'string',un7(:),...
        'backgroundcolor',[0.941 0.941 0.941]);   
    
    %Texto Altura Estructura RX
    txtAltExtRx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtAltExtRx',...
        'style','text',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[  0.845 0.83 0.1 0.025],...
        'string','Altura Torre: ',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Altura Estructura RX
    alturaExtructuraRx =  uicontrol(handles.PanelPantalla,...
        'Tag','alturaExtructuraRx',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[ 0.93 0.83 0.04 0.025]);
    
    %Texto m
    txtm0Rx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtm0Rx',...
        'style','text',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[0.98 0.83 0.02 0.025],...
        'string','m',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Texto Altura Estacion RX
    txtAltEstRx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtAltEstRx',...
        'style','text',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[  0.838 0.8 0.1 0.025],...
        'string','Altura Estacion: ',...
        'backgroundcolor',[0.941 0.941 0.941 ]);
    
    %Edit Altura Estacion RX
    alturaEstacionRx =  uicontrol(handles.PanelPantalla,...
        'Tag','alturaEstacionRx',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[ 0.93 0.8 0.04 0.025]); 
    
    %Texto m
    txtm1Rx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtm1Rx',...
        'style','text',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[0.98 0.8 0.02 0.025],...
        'string','m',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Texto Altura RX
    txtAltRx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtAltRx',...
        'style','text',...
        'units','normalized',...
        'fontWeight','bold',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[  0.88 0.765 0.06 0.025],...
        'string','Altura: ',...
        'backgroundcolor',[0.941 0.941 0.941 ]);
     
    %Edit Altura RX
    alturaRx =  uicontrol(handles.PanelPantalla,...
        'Tag','gananciaTx',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[ 0.93 0.765 0.04 0.03]);     
    
    %Texto m
    txtm2Rx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtm2Rx',...
        'style','text',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[0.98 0.77 0.02 0.025],...
        'string','m',...
        'backgroundcolor',[0.941 0.941 0.941]);

    %Grupo Perdidas RX
    PerdidasTransmisor = uibuttongroup(...
        'visible','on',...
        'fontsize',10,...
        'FontName','Times New Roman',...
        'Position',[0.69 0.54 0.16 0.2],...
        'Title','PERDIDAS RX',...
        'TitlePosition', 'centertop',...
        'backgroundcolor',[ 0.941 0.941 0.941]);
  
    %Texto Perdidas RX
    txtPerdRx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtPerdRx',...
        'style','text',...
        'units','normalized',...
        'fontWeight','bold',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[0.705 0.725 0.06 0.025],...
        'string','Perdidas',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Perdidas RX
    perdidasRx =  uicontrol(handles.PanelPantalla,...
        'Tag','perdidasRx',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[ 0.78 0.72 0.05 0.03]);
    
    %Texto dB
    txtdBRx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtdBRx',...
        'style','text',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[0.83 0.725 0.02 0.025],...
        'string','dB',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Texto Perdidas Aleatorias RX
    txtPerdAleRx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtPerdAleRx',...
        'style','text',...
        'units','normalized',...
        'fontWeight','bold',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[0.702 0.665 0.06 0.05],...
        'string','Perdidas Aleatorias: ',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Perdidas Aleatorias RX
    perdidasAleatoriasRx =  uicontrol(handles.PanelPantalla,...
        'Tag','perdidasAleatoriasRx',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[ 0.78 0.67 0.05 0.03]);
    
    %Texto dB
    txtdB0Rx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtdB0Rx',...
        'style','text',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[0.83 0.675 0.02 0.025],...
        'string','dB',...
        'backgroundcolor',[0.941 0.941 0.941]);  
    
    %Texto Error RX
    txtErrRx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtErrRx',...
        'style','text',...
        'units','normalized',...
        'fontWeight','bold',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[0.7 0.62 0.06 0.025],...
        'string','Error De',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Texto Apuntamiento RX
    txtApuRx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtApuRx',...
        'style','text',...
        'units','normalized',...
        'fontWeight','bold',...
        'HorizontalAlignment','left',...
        'fontsize',10,...
        'position',[0.7 0.595 0.08 0.025],...
        'string','Apuntamiento',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Error Apuntamiento RX
    errorApuntamientoRx =  uicontrol(handles.PanelPantalla,...
        'Tag','perdidasRx',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[ 0.78 0.605 0.05 0.03]);
    
    %Texto dB
    txtdB1Rx =  uicontrol(handles.PanelPantalla,...
        'Tag','txtdB1Rx',...
        'style','text',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',10,...
        'position',[0.83 0.61 0.02 0.025],...
        'string','dB',...
        'backgroundcolor',[0.941 0.941 0.941]);    
    
%     
%     
%     Texto Nombres TX
%     txtNombresTx = uicontrol(handles.PanelPantalla,...
%         'style','text',...
%         'units','normalized',...
%         'fontsize',11,...
%         'fontWeight','bold',...
%         'FontName', 'Times New Roman',...
%         'HorizontalAlignment','left',...
%         'position',[ 0.01 0.1 0.08 0.04],...
%         'string','Nombres:',...
%         'backgroundcolor',[0.941 0 0.941]);
%      
%      PopMenu Nombres TX
%      popMenuNombresTx =  uicontrol(handles.PanelPantalla,...
%         'Tag','popNombres',...
%         'style','popupmenu',...
%         'units','normalized',...
%         'HorizontalAlignment','center',...
%         'fontsize',8,...
%         'position',[ 0.01 0.05 0.14 0.06],...
%         'string',nombres(:),...
%         'backgroundcolor',[0.941 1 0.941]); 
    
    
    
 
    
    
    %ENLACE
    
    %Grupo de Datos Enlace
    DatosTransmisor = uibuttongroup(...
        'visible','on',...
        'fontsize',11,...
        'FontName','Times New Roman',...
        'Position',[0.316 0.01 0.369 0.92],...
        'Title','DATOS DEL ENLACE',...
        'TitlePosition', 'centertop',...
        'backgroundcolor',[  0.941 0.941 0.941]);
    
    %Texto Frecuencia
    txtFrecuencia = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.33 0.9275 0.06 0.025],...
        'string','Frecuencia:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Frecuencia
    frecuencia =  uicontrol(handles.PanelPantalla,...
        'Tag','frecuencia',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.39 0.925 0.05 0.03]);
    
     %PopMenu Unidades Frecuencia
     un={'GHz'; 'MHz'; 'Hz'};
     popMenuUnidadesFrec =  uicontrol(handles.PanelPantalla,...
        'Tag','popUnidadesFrec',...
        'style','popupmenu',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',8,...
        'position',[ 0.445 0.93 0.04 0.03],...
        'string',un(:),...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Texto Longitud de Onda
    txtLongitudOnda = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.33 0.895 0.3 0.025],...
        'string','Longitud de Onda:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Lonngitud de Onda
    LongitudOnda =  uicontrol(handles.PanelPantalla,...
        'Tag','longitudOnda',...
        'style','edit',...
        'units','normalized',...
        'fontsize',9,...
        'position',[0.41 0.895 0.03 0.026]);
    
    %Texto m
    txtm = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.445 0.895 0.02 0.025],...
        'string','m',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Texto Ancho de Banda
    txtAnchoBanda = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.5 0.9275 0.08 0.025],...
        'string','Ancho de Banda:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Ancho de Banda
    anchoBanda=  uicontrol(handles.PanelPantalla,...
        'Tag',' anchoBanda',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.58 0.925 0.05 0.03]);
    
     %PopMenu Unidades Ancho de Banda
     un8={'GHz'; 'MHz'; 'Hz'};
     popMenuUnidadesAnchoBanda =  uicontrol(handles.PanelPantalla,...
        'Tag','popUnidadesAnchoBanda',...
        'style','popupmenu',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',8,...
        'position',[ 0.625 0.93 0.04 0.03],...
        'string',un8(:),...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %PopMenu selecionar Tabla
    un98={'ENLACES'; 'ENLACE MBDA';'AUXILIARES'};
     popMenuTabla =  uicontrol(handles.PanelPantalla,...
        'Tag','popMenuTablas',...
        'style','popupmenu',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',8,...
        'position',[ 0.6 0.45 0.08 0.03],...
        'string',un98(:),...
        'backgroundcolor',[0.941 0.941 0.941]);
    %CallBack popmenu Tablas
    set(popMenuTabla,'Callback',@Cargar);
    function Cargar(source, eventdata)
        
        [num,text,Tabla]=xlsread('AUXILIARES.xlsx');
        [filas columnas]=size(Tabla);
        
        %Pop menu identificadores de la tabla
        cont=0;
        columnaTabla=1;
        columnaIdentificador=2;
        
        concesionario= repmat({''},1,filas);
        filasConcesionario=zeros(1,filas);
        for k= 2:filas
            tab= Tabla(k,columnaTabla);
            conse= Tabla(k,columnaIdentificador);
            tabmenu=get(popMenuTabla,'string');
            if strcmp(tab,tabmenu(get(popMenuTabla,'value'),1))==1
                cont = cont+1;
                concesionario(cont)= conse;
                filasConcesionario(cont)= k;
            end
        end
        concesionario = concesionario(1:cont);
        filasConcesionario = filasConcesionario(1:cont);
        
        
        %PopMenu seleccionar identificador
        popMenuIdentificadores =  uicontrol(handles.PanelPantalla,...
            'Tag','popMenuIdentificadores',...
            'style','popupmenu',...
            'units','normalized',...
            'HorizontalAlignment','center',...
            'fontsize',8,...
            'position',[ 0.57 0.38 0.12 0.03],...
            'string',concesionario(:),...
            'backgroundcolor',[0.941 0.941 0.941]);
        
        %CallBack popup identificadores
        set(popMenuIdentificadores,'Callback',@RecogerDatos);    
        function RecogerDatos(source, eventdata)
            %Repite el proceso pero no muestra nada
            [num,text,Tabla]=xlsread('AUXILIARES.xlsx');
            [filas columnas]=size(Tabla);
            
            %Pop menu identificadores de la tabla
            cont=0;
            columnaTabla=1;
            columnaIdentificador=2;
            columnaFrecuencia=3;
            columnaBW=4;
            columnaLonTx=5;
            columnaLatTx=6;
            columnaPotencia=7;
            columnaAlturaTx=8;
            columnaPolarizacion = 9;
            columnaGTx=10;
            columnaLonRx=11;
            columnaLatRx=12;
            columnaAlturaRx=13;
            
            concesionario= repmat({''},1,filas);
            filasConcesionario=zeros(1,filas);
            for k= 2:filas
                tab= Tabla(k,columnaTabla);
                conse= Tabla(k,columnaIdentificador);
                tabmenu=get(popMenuTabla,'string');
                if strcmp(tab,tabmenu(get(popMenuTabla,'value'),1))==1
                    cont = cont+1;
                    concesionario(cont)= conse;
                    filasConcesionario(cont)= k;
                end
            end
            concesionario = concesionario(1:cont);
            filasConcesionario = filasConcesionario(1:cont);
            seleccion=get(popMenuIdentificadores,'Value');
            filadatos= filasConcesionario(seleccion);
            lonTx=Tabla{filadatos,columnaLonTx};
            latTx=Tabla{filadatos,columnaLatTx};
            lonRx=Tabla{filadatos,columnaLonRx};
            latRx=Tabla{filadatos,columnaLatRx};
            set(longitudTx,'String',lonTx(1:end-1));
            set(latitudTx,'String',latTx(1:end-1));
            set(longitudRx,'String',lonRx(1:end-1));
            set(latitudRx,'String',latRx(1:end-1));
            set(popMenuUnidadesLatTx,'Value',2);
            set(popMenuUnidadesLongTx,'Value',2);
            set(popMenuUnidadesLatRx,'Value',2);
            set(popMenuUnidadesLongRx,'Value',2);
            set(alturaExtructuraTx,'String',Tabla{filadatos,columnaAlturaTx});
            set(alturaExtructuraRx,'String',Tabla{filadatos,columnaAlturaRx});
            frec=Tabla{filadatos,columnaFrecuencia}; 
            if isa(frec,'double') ==1
                frec1=frec;
            else
                frec1=conversionDecimal(frec);
            end
            set(frecuencia,'String',frec1);
            set(popMenuUnidadesFrec, 'Value',1);
            set(potenciaTx,'String',Tabla{filadatos,columnaPotencia});
            set(popMenuUnidadesPotTx, 'Value',1);
            set(gananciaTx,'String',Tabla{filadatos,columnaGTx});
            set(popMenuUnidadesGanTx, 'Value',1);
            set(gananciaRx,'String',Tabla{filadatos,columnaGTx})
            set(popMenuUnidadesGanRx, 'Value',1)
            
            set(anchoBanda,'String',Tabla{filadatos,columnaBW});
            set(popMenuUnidadesAnchoBanda, 'Value',1);
            switch Tabla{filadatos,columnaPolarizacion};
            
                case 'H'
                    pol=1;
                case 'V'
                    pol=2;
                case 'C'
                    pol=3;
            end
            set(popMenuUnidadesPolarizacion, 'Value',pol);
            
        end

    end

    
    %Texto Sensibilidad
    txtSensibilidad = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.512 0.8875 0.07 0.025],...
        'string','Sensibilidad:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Sensibilidad
    sensibilidad=  uicontrol(handles.PanelPantalla,...
        'Tag',' sensibilidad',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.58 0.885 0.05 0.03]);
    
    %Texto dBm
    txtdBm = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.635 0.885 0.02 0.025],...
        'string','dBm',...
        'backgroundcolor',[0.941 0.941 0.941]);
    

    %Texto Figura Ruido
    txtFiguraRuido = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.34 0.85 0.1 0.025],...
        'string','Figura Ruido:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Figura Ruido
    figuraRuido =  uicontrol(handles.PanelPantalla,...
        'Tag','figuraRuido',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.41 0.855 0.03 0.03]);
    
    %Texto dB
    txtdB7 = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.445 0.855 0.02 0.025],...
        'string','dB',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Texto Polarizacion
    txtPolarizacion = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.512 0.8475 0.07 0.025],...
        'string','Polarizacion:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
     %PopMenu Unidades Polarizacion
     un9={'Horizontal'; 'Vertical'; 'Circular'};
     popMenuUnidadesPolarizacion =  uicontrol(handles.PanelPantalla,...
        'Tag','popUnidadesPolarizacion',...
        'style','popupmenu',...
        'units','normalized',...
        'HorizontalAlignment','center',...
        'fontsize',8,...
        'position',[ 0.58 0.85 0.08 0.03],...
        'string',un9(:),...
        'backgroundcolor',[0.941 0.941 0.941]);    
    
    %Grupo Perdidas ENLACE
    PerdidasEnlace = uibuttongroup(...
        'visible','on',...
        'fontsize',10,...
        'FontName','Times New Roman',...
        'Position',[0.325 0.56 0.35 0.23],...
        'Title','PERDIDAS ENLACE',...
        'TitlePosition', 'centertop',...
        'backgroundcolor',[ 0.941 0.941 0.941]);
    
    %Texto Perdidas Polarizacion
    txtPerdidasPolarizacion = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.34 0.77 0.07 0.05],...
        'string','Perdidas Polarizacion:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Perdidas Polarizacion
    perdidasPolarizacion =  uicontrol(handles.PanelPantalla,...
        'Tag','perdidasPolarizacion',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.41 0.775 0.03 0.03]);
    
    %Texto dB
    txtdB10 = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.445 0.775 0.02 0.025],...
        'string','dB',...
        'backgroundcolor',[0.941 0.941 0.941]);    
    
    %Texto Margen Interferencia
    txtMargenInterferencia = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.34 0.71 0.07 0.05],...
        'string','Margen Interferencia:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Margen Interferencia
    margenInterferencia =  uicontrol(handles.PanelPantalla,...
        'Tag','margenInterferencia',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.41 0.715 0.03 0.03]);
    
    %Texto dB
    txtdB11 = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.445 0.715 0.02 0.025],...
        'string','dB',...
        'backgroundcolor',[0.941 0.941 0.941]);     
    
    %Texto Perdidas Multitrayecto
    txtPerdidasMultitrayecto = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.34 0.65 0.07 0.05],...
        'string','Perdidas Multitrayecto:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit  Perdidas Multitrayecto
    multitrayecto =  uicontrol(handles.PanelPantalla,...
        'Tag','multitrayecto',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.41 0.655 0.03 0.03]);
    
    %Texto dB
    txtdB12 = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.445 0.655 0.02 0.025],...
        'string','dB',...
        'backgroundcolor',[0.941 0.941 0.941]); 
    
    %Texto Probabilidad Multitrayecto
    txtProbMultitrayecto = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.33 0.615 0.1 0.025],...
        'string','Prob Multitrayecto:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Probabilidad Multitrayecto
    probMultitrayecto =  uicontrol(handles.PanelPantalla,...
        'Tag','probMultitrayecto',...
        'style','edit',...
        'units','normalized',...
        'fontsize',9,...
        'position',[0.415 0.62 0.05 0.026]);
    
    %Texto %
    txtm = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.4675 0.62 0.01 0.025],...
        'string','%',...
        'backgroundcolor',[0.941 0.941 0.941]);

    %Texto Densidad Vapor
    txtDensidadVapor = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.48 0.77 0.07 0.05],...
        'string','Densidad Vapor:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Densidad Vapor
    densidadVapor =  uicontrol(handles.PanelPantalla,...
        'Tag','densidadVapor',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.54 0.775 0.03 0.03]);
    
    %Texto gr/m3
    txtgr = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 057 0.775 0.04 0.025],...
        'string','gr/m3',...
        'backgroundcolor',[0.941 0.941 0.941]);    

    %Texto Temperatura
    txtTemperatura = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.58 0.795 0.07 0.025],...
        'string','Temperatura:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Temperatura
    temperatura =  uicontrol(handles.PanelPantalla,...
        'Tag','temperatura',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.59 0.76 0.03 0.03]);
    
    %Texto K
    txtK = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.62 0.76 0.02 0.025],...
        'string','�K',...
        'backgroundcolor',[0.941 0.941 0.941]);    
        
    %Texto dN1
    txtdN1 = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.48 0.71 0.04 0.025],...
        'string','dN1:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit dN1
    dN1 =  uicontrol(handles.PanelPantalla,...
        'Tag','atenEspecifica',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.515 0.71 0.03 0.03]);
    
    %Texto dB
    txtdB18 = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.545 0.71 0.02 0.025],...
        'string','dB',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Texto ep
    txtdN1 = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.58 0.71 0.02 0.025],...
        'string','ep:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit ep
    ep =  uicontrol(handles.PanelPantalla,...
        'Tag','atenEspecifica',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.6 0.71 0.03 0.03]);
    
    %Texto mRad
    txtmRad = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.635 0.71 0.02 0.025],...
        'string','mRad',...
        'backgroundcolor',[0.941 0.941 0.941]);

    %Texto Rain Rate
    txtRainRate = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.475 0.65 0.07 0.025],...
        'string','Rain Rate:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Rain Rate
    rainRate =  uicontrol(handles.PanelPantalla,...
        'Tag','rainRate',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.495 0.615 0.03 0.03]);

    %Texto Probabilidad Lluvia
    txtProbabilidadLluvia = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.56 0.65 0.1 0.025],...
        'string','Probabilidad Lluvia:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Probabilidad Lluvia
    probLluvia =  uicontrol(handles.PanelPantalla,...
        'Tag','probLluvia',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.59 0.615 0.03 0.03]);    
    
    %Texto %
    txtpr = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.625 0.615 0.02 0.025],...
        'string','%',...
        'backgroundcolor',[0.941 0.941 0.941]);    
    
    %Grupo RESULTADOS
    Resultados = uibuttongroup(...
        'visible','on',...
        'fontsize',10,...
        'FontName','Times New Roman',...
        'Position',[0.345 0.13 0.22 0.43],...
        'Title','RESULTADOS',...
        'TitlePosition', 'centertop',...
        'backgroundcolor',[ 0.941 0.941 0.941]);
    
    %Texto Distancia
    txtDistancia = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.35 0.53 0.06 0.025],...
        'string','Distancia:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Distancia
    distancia =  uicontrol(handles.PanelPantalla,...
        'Tag','distancia',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.41 0.53 0.045 0.03]);

    %Texto km
    txtkm = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.46 0.53 0.02 0.025],...
        'string','km',...
        'backgroundcolor',[0.941 0.941 0.941]); 
    
    %Texto Azimuth Tx
    txtAzimuthTx = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.35 0.49 0.06 0.025],...
        'string','Azimuth Tx:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Azimuth Tx
    azimuthTx =  uicontrol(handles.PanelPantalla,...
        'Tag','azimuthTx',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.41 0.49 0.045 0.03]);

    %Texto �E
    txtE = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.46 0.49 0.02 0.025],...
        'string','�E',...
        'backgroundcolor',[0.941 0.941 0.941]); 
    
    %Texto Azimuth Rx
    txtAzimuthRx = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.35 0.45 0.06 0.025],...
        'string','Azimuth Rx:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Azimuth Rx
    azimuthRx =  uicontrol(handles.PanelPantalla,...
        'Tag','azimuthRx',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.41 0.45 0.045 0.03]);

    %Texto �E
    txtE0 = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.46 0.45 0.02 0.025],...
        'string','�E',...
        'backgroundcolor',[0.941 0.941 0.941]); 
    
    %Texto PIRE
    txtPIRE = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.37 0.41 0.05 0.025],...
        'string','PIRE:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit PIRE
    PIRE =  uicontrol(handles.PanelPantalla,...
        'Tag','PIRE',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.41 0.41 0.045 0.03]);

    %Texto dBm
    txtdBm4 = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.46 0.41 0.02 0.025],...
        'string','dBm',...
        'backgroundcolor',[0.941 0.941 0.941]); 
    
    %Texto FSL
    txtFSL = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.37 0.37 0.05 0.025],...
        'string','FSL:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit FSL
    FSL =  uicontrol(handles.PanelPantalla,...
        'Tag','FSL',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.41 0.37 0.045 0.03]);

    %Texto dB
    txtdB15 = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.46 0.37 0.02 0.025],...
        'string','dB',...
        'backgroundcolor',[0.941 0.941 0.941]); 
    
    %Texto PL
    txPL = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.37 0.33 0.05 0.025],...
        'string','PL:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit PL
    PL =  uicontrol(handles.PanelPantalla,...
        'Tag','PL',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.41 0.33 0.045 0.03]);

    %Texto dBm
    txtdBm5 = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.46 0.33 0.02 0.025],...
        'string','dBm',...
        'backgroundcolor',[0.941 0.941 0.941]); 
    
    %Texto RSL
    txRSL = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.37 0.29 0.05 0.025],...
        'string','RSL:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit RSL
    RSL =  uicontrol(handles.PanelPantalla,...
        'Tag','RSL',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.41 0.29 0.045 0.03]);

    %Texto dBm
    txtdBm6 = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.46 0.29 0.02 0.025],...
        'string','dBm',...
        'backgroundcolor',[0.941 0.941 0.941]); 

     %Texto Margen
    txMargen = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.355 0.25 0.06 0.025],...
        'string','Margen:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Margen
    margen =  uicontrol(handles.PanelPantalla,...
        'Tag','margen',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.41 0.25 0.045 0.03]);

    %Texto dB
    txtdB16 = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.46 0.25 0.02 0.025],...
        'string','dB',...
        'backgroundcolor',[0.941 0.941 0.941]); 

    %Texto N
    txN = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.375 0.21 0.04 0.025],...
        'string','N:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit N
    N =  uicontrol(handles.PanelPantalla,...
        'Tag','N',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.41 0.21 0.045 0.03]);

    %Texto dBm
    txtdBm7 = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.46 0.21 0.02 0.025],...
        'string','dBm',...
        'backgroundcolor',[0.941 0.941 0.941]); 
    
    %Texto SNR
    txSNR = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.37 0.17 0.05 0.025],...
        'string','SNR:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit SNR
    SNR =  uicontrol(handles.PanelPantalla,...
        'Tag','SNR',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.41 0.17 0.045 0.03]);

    %Texto dB
    txtdB18 = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.46 0.17 0.02 0.025],...
        'string','dB',...
        'backgroundcolor',[0.941 0.941 0.941]); 

    %Texto Perdidas Atmosfericas
    txtPerdidasAtmosfericas = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.49 0.515 0.07 0.05],...
        'string','Perdidas Atmosfericas:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Perdidas Atmosfericas
    perdidasAtmosfericas =  uicontrol(handles.PanelPantalla,...
        'Tag','perdidasAtmosfericas',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.5 0.4875 0.045 0.03]);

    %Texto dB
    txtdB9 = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.545 0.4875 0.02 0.025],...
        'string','dB',...
        'backgroundcolor',[0.941 0.941 0.941]); 

    %Texto Perdidas por Nubes
    txtPerdidasNubes = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.49 0.425 0.07 0.05],...
        'string','Perdidas por Nubes:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Perdidas por Nubes
    perdidasNubes =  uicontrol(handles.PanelPantalla,...
        'Tag','perdidasNubes',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.5 0.3975 0.045 0.03]);

    %Texto dB
    txtdB10 = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.545 0.3975 0.02 0.025],...
        'string','dB',...
        'backgroundcolor',[0.941 0.941 0.941]); 

    %Texto Perdidas Reflexion
    txtPerdidasReflexion = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.49 0.34 0.07 0.05],...
        'string','Perdidas Reflexion:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Perdidas Reflexion
    perdidasReflexion =  uicontrol(handles.PanelPantalla,...
        'Tag','perdidasReflexion',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.5 0.31 0.045 0.03]);

    %Texto dB
    txtdB11 = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.545 0.31 0.02 0.025],...
        'string','dB',...
        'backgroundcolor',[0.941 0.941 0.941]); 
    
    %Texto Perdidas por Lluvia
    txtPerdidasLluvia = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.49 0.255 0.07 0.05],...
        'string','Perdidas por Lluvia:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Perdidas por Lluvia
    perdidasLluvia =  uicontrol(handles.PanelPantalla,...
        'Tag','perdidasLluvia',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.5 0.2275 0.045 0.03]);

    %Texto dB
    txtdB11 = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.545 0.2275 0.02 0.025],...
        'string','dB',...
        'backgroundcolor',[0.941 0.941 0.941]); 

    %Texto Perdidas por Fresnel
    txtPerdidasFresnel = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',10,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.49 0.1675 0.07 0.05],...
        'string','Perdidas por Fresnel:',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %Edit Perdidas por Fresnel
    perdidasFresnel =  uicontrol(handles.PanelPantalla,...
        'Tag','perdidasFresnel',...
        'style','edit',...
        'units','normalized',...
        'fontsize',10,...
        'position',[0.5 0.14 0.045 0.03]);

    %Texto dB
    txtdB12 = uicontrol(handles.PanelPantalla,...
        'style','text',...
        'units','normalized',...
        'fontsize',9,...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','center',...
        'position',[ 0.545 0.14 0.02 0.025],...
        'string','dB',...
        'backgroundcolor',[0.941 0.941 0.941]);     
    
     
    
    %Boton Calcular
    btCalcular= uicontrol(handles.PanelPantalla,...
    'Tag','btCalcular',...    
    'style', 'pushbutton',...
        'String', 'CALCULAR',...
        'fontsize',14,...  
        'fontWeight','bold',...
        'Position', [450 20 200 50]);


    %CallBack boton calcular
    set(btCalcular,'Callback',@Calcular);
    function Calcular(source,eventdata)
   
        
        %Obtener Datos Ingresados
        ref_LatTx= get(popMenuUnidadesLatTx,'Value');
        ref_LonTx= get(popMenuUnidadesLongTx,'Value');
        ref_LatRx= get(popMenuUnidadesLatRx,'Value');
        ref_LonRx= get(popMenuUnidadesLongRx,'Value');    
        if(ref_LatTx == 1)
            ref_LatTx = 'N'; 
        else
            ref_LatTx = 'S'; 
        end
        if(ref_LonTx == 1)
            ref_LonTx = 'E'; 
        else
            ref_LonTx = 'W'; 
        end
        if(ref_LatRx == 1)
            ref_LatRx = 'N'; 
        else
            ref_LatRx = 'S'; 
        end        
        if(ref_LonRx == 1)
            ref_LonRx = 'E'; 
        else
            ref_LonRx = 'W'; 
        end        
        longitud_Tx= get(longitudTx,'String');
        latitud_Tx= get(latitudTx,'String');
        longitud_Rx= get(longitudRx,'String');
        latitud_Rx= get(latitudRx,'String');
        longitud_Tx= strcat(longitud_Tx,ref_LatTx);
        latitud_Tx= strcat(latitud_Tx,ref_LonTx);
        longitud_Rx= strcat(longitud_Rx,ref_LatRx);
        latitud_Rx= strcat(latitud_Rx,ref_LonRx); 
        yt = conversionGrados(longitud_Tx);
        xt = conversionGrados(latitud_Tx);
        yr = conversionGrados(longitud_Rx);
        xr = conversionGrados(latitud_Rx);
 yt
 xt
 yr
 yt
        %Calculamos la distancia del enlace y los azimuths atr y art.
        [Distancia, atr, art] = distancia_azimut(xt, xr, yt, yr);
        set(distancia,'String', num2str(Distancia));
        set(azimuthTx,'String', num2str(atr));
        set(azimuthRx,'String', num2str(art));
        %%%%%%%%%set(ep,'String',num2str(ep));        

        frec= str2num(get(frecuencia,'String'));
        ref_Frec= get(popMenuUnidadesFrec, 'Value');
        if ref_Frec == 1
            frec = frec;
        end
        if ref_Frec == 2
            frec = frec/1000;
        end
        if ref_Frec == 3
            frec = frec/1000000000;
        end          
        lambda= 0.3/frec; 
        set(LongitudOnda, 'String', num2str(lambda));
        
        altura_Tx = str2num(get(alturaExtructuraTx,'String'));
        altura_Rx = str2num(get(alturaExtructuraRx,'String'));        
        
        %Procedemos a graficar el perfil topografico.
        [vectorDistancias, vectorAlturasCorregidas] = perfilTopografico(xt, yt, xr, yr, Distancia);   
        [vectorAlturasLOS puntosFresnelSuperior puntosClearFresnelSuperior puntosFresnelInferior puntosClearFresnelInferior vectorFresnel auxiliarSumaPerdidasDifraccion ] = analisisFresnel(vectorDistancias,vectorAlturasCorregidas,frec,altura_Tx,altura_Rx);
        set(perdidasFresnel,'String', num2str(auxiliarSumaPerdidasDifraccion));
        enlacefig = axes('Units','pixels','Position',[700,28,480,300],'Tag','FigEnlace');
        plot(vectorDistancias,vectorAlturasCorregidas, 'color', 'black'); hold on;
        plot(vectorDistancias, vectorAlturasLOS, 'color','red');
        plot(vectorDistancias, puntosFresnelSuperior, 'color','blue');
        plot(vectorDistancias, puntosFresnelInferior, 'color','blue');
        plot(vectorDistancias, puntosClearFresnelSuperior, 'color','green');
        plot(vectorDistancias, puntosClearFresnelInferior, 'color','green');         
        
        
        %Procedemos a graficar el mapa entre estos dos puntos de operacion.
        mapafig = axes('Units','pixels','Position',[30,28,375,300],'Tag','FigMapa');
        longitud = [yt yr];
        latitud = [xt xr];
        plot(longitud,latitud,'.r','MarkerSize',40); 
        plot_google_map;
        plot(longitud,latitud,'-b','LineWidth',2);
        
        %Calculo de la altura total en el Transmisor y Receptor.
        altura_Total_Tx= altura_Tx + vectorAlturasCorregidas(1);
        altura_Total_Rx= altura_Rx + vectorAlturasCorregidas(length(vectorAlturasCorregidas));

        set(alturaEstacionTx,'String',num2str(vectorAlturasCorregidas(1)));
        set(alturaEstacionRx,'String', num2str(vectorAlturasCorregidas(length(vectorAlturasCorregidas))));          
        set(alturaTx,'String',num2str(altura_Total_Tx));
        set(alturaRx,'String', num2str(altura_Total_Rx)); 
        
        potencia_Tx= str2num(get(potenciaTx,'String'));
        ref_PotTx = get(popMenuUnidadesPotTx, 'Value');
        if ref_PotTx == 1
            potencia_Tx = 10*log10(potencia_Tx*1000);
        else
            potencia_Tx = potencia_Tx;           
        end        
        potencia_Rx= str2num(get(potenciaRx,'String'));
        ref_PotRx = get(popMenuUnidadesPotRx, 'Value');
        if ref_PotRx == 1
            potencia_Rx = 10*log10(potencia_Rx*1000);
        else
            potencia_Rx = potencia_Rx;           
        end        
        ganancia_Tx= str2num(get(gananciaTx,'String'));
        ref_GanTx = get(popMenuUnidadesGanTx, 'Value');
        if ref_GanTx == 1
            ganancia_Tx= ganancia_Tx;
        end
        if ref_GanTx == 2
            ganancia_Tx= ganancia_Tx - 2.15;
        end
        if ref_GanTx == 3
            ganancia_Tx= 10*log10(ganancia_Tx);
        end      
        ganancia_Rx= str2num(get(gananciaRx,'String'));
        ref_GanRx = get(popMenuUnidadesGanRx, 'Value');
        if ref_GanRx == 1
            ganancia_Rx= ganancia_Rx;
        end
        if ref_GanRx == 2
            ganancia_Rx= ganancia_Rx - 2.15;
        end
        if ref_GanRx == 3
            ganancia_Rx= 10*log10(ganancia_Rx);
        end            

        perdidas_Tx= str2num(get(perdidasTx,'String'));        
        perdidas_Rx= str2num(get(perdidasRx,'String'));
        perdidas_Aleatorias_Tx= str2num(get(perdidasAleatoriasTx,'String'));
        perdidas_Aleatorias_Rx= str2num(get(perdidasAleatoriasRx,'String'));
        errorApuntamiento_Tx= str2num(get(errorApuntamientoTx,'String'));
        errorApuntamiento_Rx= str2num(get(errorApuntamientoRx,'String'));
              

        anchoDeBanda = str2num(get(anchoBanda,'String'));        
        ref_Ancho_Banda= get(popMenuUnidadesAnchoBanda, 'Value');        
        if ref_Ancho_Banda == 1
            anchoDeBanda = anchoDeBanda * 1000000000;
        end
        if ref_Ancho_Banda == 2
            anchoDeBanda = anchoDeBanda * 1000000;
        end
        if ref_Ancho_Banda == 3
            anchoDeBanda = anchoDeBanda;
        end           
        sensib= str2num(get(sensibilidad,'String'));
        figura_Ruido= str2num(get(figuraRuido,'String'));
        margen_Interferencia= str2num(get(margenInterferencia,'String'));
        perdidas_Polarizacion= str2num(get(perdidasPolarizacion,'String'));
        multitray= str2num(get(multitrayecto,'String'));
        densidad_Vapor= str2num(get(densidadVapor,'String'));
        temp= str2num(get(temperatura,'String'));
        rain_Rate= str2num(get(rainRate,'String'));
        prob_Lluvia= str2num(get(probLluvia,'String'));
        DN1= str2num(get(dN1, 'String'));
        
        
        %Calculamos la probabilidad de perdidas por multitrayecto.
        %%[p ep] = LMP(altura_Total_Tx, altura_Total_Rx, Distancia, multitray, frec, DN1);
        [probabilidad anguloInclinacion] = LMP(altura_Total_Tx, altura_Total_Rx, Distancia, multitray, frec, DN1);
        set(probMultitrayecto, 'String', num2str(probabilidad))
        set(ep,'String',num2str(anguloInclinacion));
        
        %Calculamos las perdidas atmosfericas.
        atmosphericLosses = Latmosf(frec,densidad_Vapor,Distancia);
        set(perdidasAtmosfericas, 'String', num2str(atmosphericLosses));
        
        %Calculamos las perdidas por niebla y nubes
        if altura_Total_Tx < 200 && altura_Total_Rx < 200
            condicion = 1;
        else
            condicion = 2;
        end        
        perdidasNubesNiebla = Lnubes(frec, anguloInclinacion, temp, condicion);
        set(perdidasNubes, 'String', num2str(perdidasNubesNiebla));
        
        %Calculamos las perdidas por reflexion y en el espacio libre.
        lmp = ganancia_Tx + ganancia_Rx + 20*log10(altura_Total_Tx*altura_Total_Rx) -40*log10(Distancia*1000);
        set(perdidasReflexion,'String',num2str(lmp));
        fsl = 92.45 + 20*log10(frec) + 20*log10(Distancia);
        if fsl > lmp
            perdidas_FSL = fsl;
        else
            perdidas_FSL = lmp;
        end
        
        %Calculamos las perdidas por lluvia.
        ref_Polarizacion= get(popMenuUnidadesPolarizacion, 'Value');
        if ref_Polarizacion == 1        %Polarizacion Horizontal
            polarizacion = 1;           
        end      
        if ref_Polarizacion == 2        %Polarizacion Vertical
            polarizacion = 2;
        end       
        if ref_Polarizacion == 3        %Polarizacion Circular
            polarizacion = 3;
        end
        if frec>=2
            [kFinal,alphaFinal] = coef_reg(anguloInclinacion, frec, polarizacion)
            do = 35*exp(-0.015*rain_Rate);
            r = (1/(1+(Distancia/do)));
            aux_Atten = kFinal*Distancia*r*(rain_Rate)^alphaFinal
            p = (100-prob_Lluvia);
            
            if(abs(xt)>30 || abs(xr)>30)
                perdidas_Lluvia = aux_Atten*0.12*p^(-0.546-(0.043*log10(p)));
            else
                perdidas_Lluvia = aux_Atten*0.07*p^(-0.855-(0.139*log10(p)));
            end
            set(perdidasLluvia,'String',num2str(perdidas_Lluvia));
        else
            perdidas_Lluvia = 0;
            set(perdidasLluvia,'String',num2str(perdidas_Lluvia));
        end
        %Calculamos el PIRE,
        resultado_PIRE= pire(potencia_Tx, perdidas_Tx, ganancia_Tx, perdidas_Aleatorias_Tx);
        set(PIRE,'String',num2str(resultado_PIRE));
        %Calculamos las perdidas totales en el camino.
        pathLosses = - perdidas_FSL - errorApuntamiento_Tx - perdidas_Lluvia - multitray - auxiliarSumaPerdidasDifraccion - atmosphericLosses - perdidasNubesNiebla;  
        set(FSL,'String',num2str(perdidas_FSL));
        set(PL,'String',num2str(pathLosses));
        %Calculamos las ganancias total de la receptora.
        totalRxGain = - perdidas_Aleatorias_Rx + ganancia_Rx - perdidas_Polarizacion - perdidas_Rx - errorApuntamiento_Rx;
        %Calculamos la potencia en el receptor (RSL)
        rsl = resultado_PIRE + pathLosses + totalRxGain;
        set(RSL,'String',num2str(rsl));
        %Calculamos el Margen de Enlace.
        netMargin = rsl - (sensib + margen_Interferencia);
        set(margen,'String',num2str(netMargin));
        %Calculamos el NdBm.
        NdBm = -174 + (10*log10(anchoDeBanda))+ figura_Ruido;   
        set(N,'String',num2str(NdBm));
        %Calculamos la relacion Signal-To-Noise Ratio.
        resultado_SNR = rsl - (NdBm + margen_Interferencia);
        set(SNR,'String',num2str(resultado_SNR));   
    
    end
  
    %CARGAR DATOS INICIALES
    set(longitudTx,'String','79�0''55.07"');
    set(latitudTx,'String','02�54''2.51"');
    set(longitudRx,'String','79�1''1.29"');
    set(latitudRx,'String','02�54''30.02"');
    set(potenciaTx,'String','0.13583');
    set(potenciaRx,'String','0.13583');
    set(gananciaTx,'String','17.85');
    set(gananciaRx,'String','17.85');
    set(alturaTx,'String','2855');
    set(alturaRx,'String','2976');
    set(alturaExtructuraTx,'String','15');
    set(alturaExtructuraRx,'String','20');
    set(alturaEstacionTx,'String','2840');
    set(alturaEstacionRx,'String','2956');
    set(perdidasTx,'String','1.5');
    set(perdidasRx,'String','2');
    set(perdidasAleatoriasTx,'String','2');
    set(perdidasAleatoriasRx,'String','2');
    set(errorApuntamientoTx,'String','1');
    set(errorApuntamientoRx,'String','1');
    set(frecuencia,'String','2.44175');
    set(anchoBanda,'String','0.005');
    set(sensibilidad,'String','-88');
    set(dN1,'String','-200');
    set(figuraRuido,'String','7');
    set(margenInterferencia,'String','1');
    set(perdidasPolarizacion,'String','0.2');
    set(multitrayecto,'String','5');
    set(densidadVapor,'String','7.5');
    set(temperatura,'String','273.15');
    set(rainRate,'String','95');
    set(probLluvia,'String','99.99');
    set(popMenuUnidadesLongTx, 'Value',2);
    set(popMenuUnidadesLatTx, 'Value',2);
    set(popMenuUnidadesLongRx, 'Value',2);
    set(popMenuUnidadesLatRx, 'Value',2);
    
end

% ANALISIS DEL ESPECTRO DEL AUSTRO
function AalisisAustro_Callback(hObject, eventdata, handles)
    %Borrar elementos de la interfaz y cambiar el titulo del Panel 
    HandlePanelPantalla = get(handles.PanelPantalla);
    HandleVentana = get(handles.figure1);
    set(handles.PanelPantalla,'Title','ANALISIS DEL USO DEL ESPECTRO');
    delete(HandlePanelPantalla.Children);
    for k = 1:length(HandleVentana.Children)
        child = get(HandleVentana.Children(k));
        tag = child.Tag;            
        switch tag
            case 'Enlaces'
            case 'EstacionesBase'
            case 'PanelPantalla'
            case 'uitoolbar3'
            otherwise
                delete(HandleVentana.Children(k));
        end
    end

    %Variables Globales Tablas
    global TablaSiraTv TablaSCDMA450 TablaFWA TablaEnlaces TablaVHFUHF TablaMDBA TablaAuxiliares;
      
    %RadioButtons para seleccionar base de Datos
    SIRATV = uicontrol(handles.PanelPantalla,...
        'style','radiobutton',...
        'units','normalized',...
        'fontsize',12,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.03 0.92 0.08 0.045],...
        'string','SIRA TV',...
        'Tag','RB1',...
        'backgroundcolor',[0.941 0.941 0.941]);
   
    %CALLBACK Radio Button SIRATV
    set(SIRATV,'Callback',@CallBackSiraTV);
    function CallBackSiraTV(source,eventdata)
        
        %Seleccion de la Tabla SIRATV
        Tabla = TablaSiraTv;
        [filas columnas] = size(Tabla);
        
        %Poner los demas radioButtons como deseleccionados
        set(SIRATV,'Value',1);
        set(SCDMA,'Value',0);
        set(FWA,'Value',0);
        set(ENLACES,'Value',0);
        set( VHFUHF,'Value',0);
        set(MDBA,'Value',0);
        set(AUXILIARES,'Value',0);
        
        %BORRAR TODO DE LA PANTALLA
        HandlePanelPantalla = get(handles.PanelPantalla);
        for k = 1:length(HandlePanelPantalla.Children)
            child = get(HandlePanelPantalla.Children(k));
            tag = child.Tag;            
            switch tag
                case 'RB1'
                case 'RB2'
                case 'RB3'
                case 'RB4'
                case 'RB5'
                case 'RB6'
                case 'RB7'    
                otherwise
                    delete(HandlePanelPantalla.Children(k));
            end
        end
        HandleVentana = get(handles.figure1);
        for k = 1:length(HandleVentana.Children)
            child = get(HandleVentana.Children(k));
            tag = child.Tag;            
            switch tag
                case 'Enlaces'
                case 'EstacionesBase'
                case 'PanelPantalla'
                case 'uitoolbar3'
                case 'GrupoBaseDatos'
                otherwise
                    delete(HandleVentana.Children(k));
            end
        end

        
        %RADIO BUTTONS PARA SELECCIONAR CATEGORIA
        GrupoCategorias = uibuttongroup(...
            'visible','on',...
            'fontsize',10,...
            'FontName','Times New Roman',...
            'Position',[0.025 0.5 0.23 0.3],...
            'Title','CATEGORIAS',...
            'Tag', 'GrupoCategorias',...
            'backgroundcolor',[ 0.941 0.941 0.941]);
        
        %AMPLITUD MODULADA        
        AM = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.78 0.15 0.04],...
            'string','AMPLITUD MODULADA',...
            'Tag','AM',...
            'backgroundcolor',[0.941 0.941 0.941]);        
                 
        %CALLBACK Radio Button AMPLITUD MODULADA
        set(AM,'Callback',@CallBackAM);
        function CallBackAM(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AM,'Value',1);
            set(FM,'Value',0);
            set(TELEVISIONABIERTA,'Value',0);
            set(ONDACORTA,'Value',0);
            set(TELEVISIONCODIFICADASATELITAL,'Value',0);
            set(TELEVISIONCODIFICADATERRESTRE,'Value',0);
            set(TELEVISIONDIGITALTERRESTRE,'Value',0);
            set(TELEVISIONCABLE,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'TVABIERTA'
                    case 'ONDACORTA'
                    case 'TELEVISIONCODIFICADASATELITAL'
                    case 'TELEVISIONCODIFICADATERRESTRE'
                    case 'TELEVISIONDIGITALTERRESTRE'
                    case 'TELEVISIONCABLE'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoCategorias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end

            %Texto AZUAY
            categoriaAM = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[ 0.27 0.87 0.25 0.03],...
                'string','AZUAY',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieA = axes('Units','pixels',...
                'Position',[380,320,250,250],...
                'Tag','PieSFWA');
            x = [0	28.81355932	1.694915254	69.49152542];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);

            %Texto CANAR
            categoriaC = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[ 0.65 0.87 0.25 0.03],...
                'string','CA�AR',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieB = axes('Units','pixels',...
                'Position',[800,320,250,250],...
                'Tag','PieSFWA');
            x = [0	23.72881356	0	76.27118644];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);
            
            %Texto EL ORO
            categoriaL = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[0.27 0.6 0.25 0.03],...
                'string','EL ORO',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieC = axes('Units','pixels',...
                'Position',[380,150,250,250],...
                'Tag','PieSFWA');
            x = [0	10.16949153	3.389830508	86.44067797];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);
            
            %Texto LOJA
            categoriaO = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[0.65 0.6 0.25 0.03],...
                'string','LOJA',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieO = axes('Units','pixels',...
                'Position',[800,150,250,250],...
                'Tag','PieSFWA');
            x = [1.694915254	3.389830508	1.694915254	93.22033898];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);
            
            %Texto MORONA
            categoriaM = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[0.27 0.3 0.25 0.03],...
                'string','MORONA SANTIAGO',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieM = axes('Units','pixels',...
                'Position',[380,-10,250,250],...
                'Tag','PieSFWA');
            x = [0	0	0	100];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);
            
            %Texto ZAMORA
            categoriaZ = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[0.65 0.3 0.25 0.03],...
                'string','ZAMORA',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieZ = axes('Units','pixels',...
                'Position',[800,-10,250,250],...
                'Tag','PieSFWA');
            x = [0	0	0	100];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);
            
            
        end
        
        %FRECUENCIA MODULADA
        FM = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.7 0.15 0.04],...
            'string','FRECUENCIA MODULADA',...
            'Tag','FM',...
            'backgroundcolor',[0.941 0.941 0.941]);
        
        %CALLBACK Radio Button FRECUENCIA MODULADA
        set(FM,'Callback',@CallBackFM);
        function CallBackFM(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AM,'Value',0);
            set(FM,'Value',1);
            set(TELEVISIONABIERTA,'Value',0);
            set(ONDACORTA,'Value',0);
            set(TELEVISIONCODIFICADASATELITAL,'Value',0);
            set(TELEVISIONCODIFICADATERRESTRE,'Value',0);
            set(TELEVISIONDIGITALTERRESTRE,'Value',0);
            set(TELEVISIONCABLE,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'TVABIERTA'
                    case 'ONDACORTA'
                    case 'TELEVISIONCODIFICADASATELITAL'
                    case 'TELEVISIONCODIFICADATERRESTRE'
                    case 'TELEVISIONDIGITALTERRESTRE'
                    case 'TELEVISIONCABLE'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoCategorias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Texto AZUAY
            categoriaAM = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[ 0.27 0.87 0.25 0.03],...
                'string','AZUAY',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieA = axes('Units','pixels',...
                'Position',[380,320,250,250],...
                'Tag','PieSFWA');
            x = [2 70 8 20];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);

            %Texto CANAR
            categoriaC = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[ 0.65 0.87 0.25 0.03],...
                'string','CA�AR',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieB = axes('Units','pixels',...
                'Position',[800,320,250,250],...
                'Tag','PieSFWA');
            x = [2 52 2 44];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);
            
            %Texto EL ORO
            categoriaL = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[0.27 0.6 0.25 0.03],...
                'string','EL ORO',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieC = axes('Units','pixels',...
                'Position',[380,150,250,250],...
                'Tag','PieSFWA');
            x = [8 72 0 20];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);
            
            %Texto LOJA
            categoriaO = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[0.65 0.6 0.25 0.03],...
                'string','LOJA',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieO = axes('Units','pixels',...
                'Position',[800,150,250,250],...
                'Tag','PieSFWA');
            x = [20 52 8 20];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);
            
            %Texto MORONA
            categoriaM = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[0.27 0.3 0.25 0.03],...
                'string','MORONA SANTIAGO',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieM = axes('Units','pixels',...
                'Position',[380,-10,250,250],...
                'Tag','PieSFWA');
            x = [10 38 18 34];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);
            
            %Texto ZAMORA
            categoriaZ = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[0.65 0.3 0.25 0.03],...
                'string','ZAMORA',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieZ = axes('Units','pixels',...
                'Position',[800,-10,250,250],...
                'Tag','PieSFWA');
            x = [10 26 2 62 ];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);
         
        end
        

        %TELEVISION ABIERTA
        TELEVISIONABIERTA = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.62 0.15 0.04],...
            'string','TELEVISION ABIERTA',...
            'Tag','TVABIERTA',...
            'backgroundcolor',[0.941 0.941 0.941]);        
        
        %CALLBACK Radio Button TELEVISION ABIERTA
        set(TELEVISIONABIERTA,'Callback',@CallBackTELEVISIONABIERTA);
        function CallBackTELEVISIONABIERTA(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AM,'Value',0);
            set(FM,'Value',0);
            set(TELEVISIONABIERTA,'Value',1);
            set(ONDACORTA,'Value',0);
            set(TELEVISIONCODIFICADASATELITAL,'Value',0);
            set(TELEVISIONCODIFICADATERRESTRE,'Value',0);
            set(TELEVISIONDIGITALTERRESTRE,'Value',0);
            set(TELEVISIONCABLE,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'TVABIERTA'
                    case 'ONDACORTA'
                    case 'TELEVISIONCODIFICADASATELITAL'
                    case 'TELEVISIONCODIFICADATERRESTRE'
                    case 'TELEVISIONDIGITALTERRESTRE'
                    case 'TELEVISIONCABLE'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoCategorias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Texto AZUAY
            categoriaAM = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[ 0.27 0.87 0.25 0.03],...
                'string','AZUAY',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieA = axes('Units','pixels',...
                'Position',[380,320,250,250],...
                'Tag','PieSFWA');
            x = [28.57142857	45.23809524	0	26.19047619];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);

            %Texto CANAR
            categoriaC = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[ 0.65 0.87 0.25 0.03],...
                'string','CA�AR',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieB = axes('Units','pixels',...
                'Position',[800,320,250,250],...
                'Tag','PieSFWA');
            x = [11.9047619	28.57142857	0	59.52380952];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);
            
            %Texto EL ORO
            categoriaL = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[0.27 0.6 0.25 0.03],...
                'string','EL ORO',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieC = axes('Units','pixels',...
                'Position',[380,150,250,250],...
                'Tag','PieSFWA');
            x = [11.9047619	30.95238095	0	57.14285714];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);
            
            %Texto LOJA
            categoriaO = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[0.65 0.6 0.25 0.03],...
                'string','LOJA',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieO = axes('Units','pixels',...
                'Position',[800,150,250,250],...
                'Tag','PieSFWA');
            x = [4.761904762	42.85714286	2.380952381	35.71428571];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);
            
            %Texto MORONA
            categoriaM = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[0.27 0.3 0.25 0.03],...
                'string','MORONA SANTIAGO',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieM = axes('Units','pixels',...
                'Position',[380,-10,250,250],...
                'Tag','PieSFWA');
            x = [23.80952381	30.95238095	0	45.23809524];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);
            
            %Texto ZAMORA
            categoriaZ = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[0.65 0.3 0.25 0.03],...
                'string','ZAMORA',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieZ = axes('Units','pixels',...
                'Position',[800,-10,250,250],...
                'Tag','PieSFWA');
            x = [16.66666667	21.42857143	4.761904762	42.85714286];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);
                     

        end
        
        
        %ONDA CORTA
        ONDACORTA = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.54 0.15 0.04],...
            'string','ONDA CORTA',...
            'Tag','ONDACORTA',...
            'backgroundcolor',[0.941 0.941 0.941]);
        
        %CALLBACK Radio Button ONDA CORTA
        set(ONDACORTA,'Callback',@CallBackONDACORTA);
        function CallBackONDACORTA(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AM,'Value',0);
            set(FM,'Value',0);
            set(TELEVISIONABIERTA,'Value',0);
            set(ONDACORTA,'Value',1);
            set(TELEVISIONCODIFICADASATELITAL,'Value',0);
            set(TELEVISIONCODIFICADATERRESTRE,'Value',0);
            set(TELEVISIONDIGITALTERRESTRE,'Value',0);
            set(TELEVISIONCABLE,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'TVABIERTA'
                    case 'ONDACORTA'
                    case 'TELEVISIONCODIFICADASATELITAL'
                    case 'TELEVISIONCODIFICADATERRESTRE'
                    case 'TELEVISIONDIGITALTERRESTRE'
                    case 'TELEVISIONCABLE'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoCategorias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
           
            %Texto AZUAY
            categoriaAM = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[ 0.27 0.87 0.25 0.03],...
                'string','AZUAY',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieA = axes('Units','pixels',...
                'Position',[380,320,250,250],...
                'Tag','PieSFWA');
            x = [0	0	0	100];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);

            %Texto CANAR
            categoriaC = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[ 0.65 0.87 0.25 0.03],...
                'string','CA�AR',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieB = axes('Units','pixels',...
                'Position',[800,320,250,250],...
                'Tag','PieSFWA');
            x = [0	0	0	100];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);
            
            %Texto EL ORO
            categoriaL = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[0.27 0.6 0.25 0.03],...
                'string','EL ORO',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieC = axes('Units','pixels',...
                'Position',[380,150,250,250],...
                'Tag','PieSFWA');
            x = [0	0	0	100];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);
            
            %Texto LOJA
            categoriaO = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[0.65 0.6 0.25 0.03],...
                'string','LOJA',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieO = axes('Units','pixels',...
                'Position',[800,150,250,250],...
                'Tag','PieSFWA');
            x = [0	1.666666667	1.666666667	96.66666667];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);
            
            %Texto MORONA
            categoriaM = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[0.27 0.3 0.25 0.03],...
                'string','MORONA SANTIAGO',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieM = axes('Units','pixels',...
                'Position',[380,-10,250,250],...
                'Tag','PieSFWA');
            x = [0	0	6.666666667	93.33333333];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);
            
            %Texto ZAMORA
            categoriaZ = uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',13,...
                'position',[0.65 0.3 0.25 0.03],...
                'string','ZAMORA',...
                'backgroundcolor',[0.941 0.941 0.941]);
            %Pie De Fechas Autorizacion
            PieZ = axes('Units','pixels',...
                'Position',[800,-10,250,250],...
                'Tag','PieSFWA');
            x = [0	0	0	100];
            labels = {'Publico','Privado','Comunitario','Canales Libres'};
            pie3(x,labels);

        end
        
        
        %TELEVISION CODIFICADA SATELITAL
        TELEVISIONCODIFICADASATELITAL = uicontrol(handles.PanelPantalla,...
            'style','text',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.46 0.21 0.04],...
            'string','',...
            'Tag','TELEVISIONCODIFICADASATELITAL',...
            'backgroundcolor',[0.941 0.941 0.941]);

        
        %TELEVISION CODIFICADA TERRESTRE
        TELEVISIONCODIFICADATERRESTRE = uicontrol(handles.PanelPantalla,...
            'style','text',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.38 0.22 0.04],...
            'string','',...
            'Tag','TELEVISIONCODIFICADATERRESTRE',...
            'backgroundcolor',[0.941 0.941 0.941]);

        
        %TELEVISION DIGITAL TERRESTRE
        TELEVISIONDIGITALTERRESTRE = uicontrol(handles.PanelPantalla,...
            'style','text',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.3 0.2 0.04],...
            'string','',...
            'Tag','TELEVISIONDIGITALTERRESTRE',...
            'backgroundcolor',[0.941 0.941 0.941]);
        
    
        %TELEVISION POR CABLE
        TELEVISIONCABLE = uicontrol(handles.PanelPantalla,...
            'style','text',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.22 0.2 0.04],...
            'string','',...
            'Tag','TELEVISIONCABLE',...
            'backgroundcolor',[0.941 0.941 0.941]);
   
    end
    
    
    SCDMA = uicontrol(handles.PanelPantalla,...
        'style','radiobutton',...
        'units','normalized',...
        'fontsize',12,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.15 0.92 0.09 0.045],...
        'string','SCDMA 450',...
        'Tag','RB2',...
        'backgroundcolor',[0.941 0.941 0.941]);
  
    %CALLBACK Radio Button SCDMA
    set(SCDMA,'Callback',@CallBackSCDMA);
    function CallBackSCDMA(source,eventdata)
        
        %Seleccion de la Tabla SIRATV
        Tabla = TablaSCDMA450;
        [filas columnas] = size(Tabla);
        
        %Poner los demas radioButtons como deseleccionados
        set(SIRATV,'Value',0);
        set(SCDMA,'Value',1);
        set(FWA,'Value',0);
        set(ENLACES,'Value',0);
        set( VHFUHF,'Value',0);
        set(MDBA,'Value',0);
        set(AUXILIARES,'Value',0);
        
        %BORRAR TODO DE LA PANTALLA
        HandlePanelPantalla = get(handles.PanelPantalla);
        for k = 1:length(HandlePanelPantalla.Children)
            child = get(HandlePanelPantalla.Children(k));
            tag = child.Tag;            
            switch tag
                case 'RB1'
                case 'RB2'
                case 'RB3'
                case 'RB4'
                case 'RB5'
                case 'RB6'
                case 'RB7'    
                otherwise
                    delete(HandlePanelPantalla.Children(k));
            end
        end
        HandleVentana = get(handles.figure1);
        for k = 1:length(HandleVentana.Children)
            child = get(HandleVentana.Children(k));
            tag = child.Tag;            
            switch tag
                case 'Enlaces'
                case 'EstacionesBase'
                case 'PanelPantalla'
                case 'uitoolbar3'
                case 'GrupoBaseDatos'
                otherwise
                    delete(HandleVentana.Children(k));
            end
        end
        
        %Barras ANCHO BANDA
        EspFrecCDMA = axes('Units','pixels',...
            'Position',[120,40,620,400],...
            'Tag','EspFrecCDMA');
        hold on;
        y=[1 1 ];
        x_l=[479 489];
        x_u=[483.4 492.975];
        for z=1:length(y)
            patch([x_l(z) x_l(z) x_u(z) x_u(z)],[0 y(z) y(z) 0],'b');
        end
        y=[1 1];
        x_l=[452.5 462.5];
        x_u=[454.4 464.4];
        for z=1:length(y)
            patch([x_l(z) x_l(z) x_u(z) x_u(z)],[0 y(z) y(z) 0],'r');
        end
        hold off;
        xlabel('Frecuencia [MHz]');
        ylabel('Potencia [W]');
        legend('Banda Alta','      TX','Banda Baja','     RX','Location','North');
        grid on;

        %Texto ESPECTRO DE FRECUENCIAS
        espFrecuenciasCDMA = uicontrol(handles.PanelPantalla,...
            'Tag','categoriaCDMA',...
            'style','text',...
            'fontWeight','bold',...
            'units','normalized',...
            'HorizontalAlignment','center',...
            'fontsize',17,...
            'position',[ 0.2 0.81 0.35 0.05],...
            'string','ESPECTRO DE FRECUENCIAS',...
            'backgroundcolor',[0.941 0.941 0.941]);
        
        %Texto FECHAS AUTORIZACION
        espFrecuenciasCDMA = uicontrol(handles.PanelPantalla,...
            'Tag','categoriaCDMA',...
            'style','text',...
            'fontWeight','bold',...
            'units','normalized',...
            'HorizontalAlignment','center',...
            'fontsize',17,...
            'position',[ 0.65 0.81 0.35 0.05],...
            'string','FECHA AUTORIZACION',...
            'backgroundcolor',[0.941 0.941 0.941]);
        
        %Pie De Fechas Autorizacion
        PieSCDMA = axes('Units','pixels',...
            'Position',[750,100,400,400],...
            'Tag','PieSCDMA');
        %x = [16 12 4];
        %labels = {'18/01/2013','19/06/2013','08/04/2011'};
        x = [1 2 3 2 4];
        labels = {'16/01/2007','16/05/2012','08/02/2010','21/09/2010','16/01/2007'};
        pie3(x,labels);

        %Texto conclusion SCDMA
        espFrecuenciasCDMA = uicontrol(handles.PanelPantalla,...
            'Tag','categoriaCDMA',...
            'style','text',...
            'units','normalized',...
            'HorizontalAlignment','center',...
            'fontsize',14,...
            'position',[ 0.65 0.05 0.35 0.25],...
            'string','En la ciudad de Cuenca existen 12 bases de la empresa ETAPA en la banda CDMA450 destinadas a la comunicaci�n telef�nica fija-m�vil.',...
            'backgroundcolor',[0.941 0.941 0.941]);
    end


    FWA = uicontrol(handles.PanelPantalla,...
        'style','radiobutton',...
        'units','normalized',...
        'fontsize',12,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.3 0.92 0.05 0.045],...
        'string','FWA',...
        'Tag','RB3',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %CALLBACK Radio Button FWA
    set(FWA,'Callback',@CallBackFWA);
    function CallBackFWA(source,eventdata)
        
        %Poner los demas radioButtons como deseleccionados
        set(SIRATV,'Value',0);
        set(SCDMA,'Value',0);
        set(FWA,'Value',1);
        set(ENLACES,'Value',0);
        set( VHFUHF,'Value',0);
        set(MDBA,'Value',0);
        set(AUXILIARES,'Value',0);
        
        %BORRAR TODO DE LA PANTALLA
        HandlePanelPantalla = get(handles.PanelPantalla);
        for k = 1:length(HandlePanelPantalla.Children)
            child = get(HandlePanelPantalla.Children(k));
            tag = child.Tag;            
            switch tag
                case 'RB1'
                case 'RB2'
                case 'RB3'
                case 'RB4'
                case 'RB5'
                case 'RB6'
                case 'RB7'    
                otherwise
                    delete(HandlePanelPantalla.Children(k));
            end
        end
        HandleVentana = get(handles.figure1);
        for k = 1:length(HandleVentana.Children)
            child = get(HandleVentana.Children(k));
            tag = child.Tag;            
            switch tag
                case 'Enlaces'
                case 'EstacionesBase'
                case 'PanelPantalla'
                case 'uitoolbar3'
                case 'GrupoBaseDatos'
                otherwise
                    delete(HandleVentana.Children(k));
            end
        end
        
            %Barras ANCHO BANDA
            l=cell(1,2);
            l{1}='PUBLICO';
            l{2}='PRIVADO';
           
            valores=[100 0];
            EspValMDBA = axes('Units','pixels',...
                'Position',[250,100,650,350],...
                'Tag','EspValMDBA');
            barh(valores,...
                'EdgeColor','b',...
                'FaceColor','b',...
                'BarWidth', 0.8);
            set(EspValMDBA,'yticklabel', l); 
            grid on;
            
            %Texto FRECUENCIAS 
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.3 0.8 0.35 0.05],...
                'string','CLASIFICACION %',...
                'backgroundcolor',[0.941 0.941 0.941]);

        %Texto conclusion FWA
        espFrecuenciasFWA = uicontrol(handles.PanelPantalla,...
            'Tag','categoriaCDMA',...
            'style','text',...
            'units','normalized',...
            'HorizontalAlignment','center',...
            'fontsize',14,...
            'position',[ 0.01 0.05 0.95 0.075],...
            'string','En las bandas 479 � 483,480 MHz y 489 � 492,975 MHz, tambi�n operan sistemas FWA (Fixed Wireless Access) para el servicio FIJO en el Cant�n Cuenca',...
            'backgroundcolor',[0.941 0.941 0.941]);
    end

    
    ENLACES = uicontrol(handles.PanelPantalla,...
        'style','radiobutton',...
        'units','normalized',...
        'fontsize',12,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.42 0.92 0.08 0.045],...
        'string','ENLACES',...
        'Tag','RB4',...
        'backgroundcolor',[0.941 0.941 0.941]);    

    %CALLBACK Radio Button ENLACES
    set(ENLACES,'Callback',@CallBackEnlaces);
    function CallBackEnlaces(source,eventdata)

        %Seleccion de la Tabla ENLACES
        Tabla = TablaEnlaces;
        [filas columnas] = size(Tabla);
        
        %Poner los demas radioButtons como deseleccionados
        set(SIRATV,'Value',0);
        set(SCDMA,'Value',0);
        set(FWA,'Value',0);
        set(ENLACES,'Value',1);
        set( VHFUHF,'Value',0);
        set(MDBA,'Value',0);
        set(AUXILIARES,'Value',0);
        
        %BORRAR TODO DE LA PANTALLA
        HandlePanelPantalla = get(handles.PanelPantalla);
        for k = 1:length(HandlePanelPantalla.Children)
            child = get(HandlePanelPantalla.Children(k));
            tag = child.Tag;            
            switch tag
                case 'RB1'
                case 'RB2'
                case 'RB3'
                case 'RB4'
                case 'RB5'
                case 'RB6'
                case 'RB7'    
                otherwise
                    delete(HandlePanelPantalla.Children(k));
            end
        end
        HandleVentana = get(handles.figure1);
        for k = 1:length(HandleVentana.Children)
            child = get(HandleVentana.Children(k));
            tag = child.Tag;            
            switch tag
                case 'Enlaces'
                case 'EstacionesBase'
                case 'PanelPantalla'
                case 'uitoolbar3'
                case 'GrupoBaseDatos'
                otherwise
                    delete(HandleVentana.Children(k));
            end
        end
        
        
        %RADIO BUTTONS PARA SELECCIONAR CATEGORIA
        GrupoProvincias = uibuttongroup(...
            'visible','on',...
            'fontsize',10,...
            'FontName','Times New Roman',...
            'Position',[0.025 0.4 0.15 0.4],...
            'Title','PROVINCIAS',...
            'Tag', 'GrupoProvincias',...
            'backgroundcolor',[ 0.941 0.941 0.941]);
        
        %AZUAY        
        AZUAY = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.78 0.1 0.04],...
            'string','AZUAY',...
            'Tag','AZUAY',...
            'backgroundcolor',[0.941 0.941 0.941]);        
                 
        %CALLBACK Radio Button AZUAY
        set(AZUAY,'Callback',@CallBackAZUAY);
        function CallBackAZUAY(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',1);
            set(CANAR,'Value',0);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end

            %Texto ENLACES AUSTRO
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.35 0.75 0.35 0.05],...
                'string','ENLACES TOTAL: 693',...
                'backgroundcolor',[0.941 0.941 0.941]);


            %Pie De Fechas Autorizacion
            PieSFWA = axes('Units','pixels',...
                'Position',[250,-170,800,800],...
                'Tag','PieSFWA');
            x = [45.32 54.68];
            labels = {'BANDA UTILIZADA 45.32%','BANDA LIBRE 54.68%'};
            pie3(x,labels);    
           
        end
        
        %CA�AR
        CANAR = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.7 0.1 0.04],...
            'string','CA�AR',...
            'Tag','CANAR',...
            'backgroundcolor',[0.941 0.941 0.941]);

        %CALLBACK Radio Button CANAR
        set(CANAR,'Callback',@CallBackCANAR);
        function CallBackCANAR(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',1);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Texto ENLACES AUSTRO
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.35 0.75 0.35 0.05],...
                'string','ENLACES TOTAL: 295',...
                'backgroundcolor',[0.941 0.941 0.941]);


            %Pie De Fechas Autorizacion
            PieSFWA = axes('Units','pixels',...
                'Position',[250,-170,800,800],...
                'Tag','PieSFWA');
            x = [26.02 73.98];
            labels = {'BANDA UTILIZADA 26.02%','BANDA LIBRE 73.98%'};
            pie3(x,labels);    
           
        end
        

        %LOJA
        LOJA = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.62 0.1 0.04],...
            'string','LOJA',...
            'Tag','LOJA',...
            'backgroundcolor',[0.941 0.941 0.941]);        
       
        %CALLBACK Radio Button LOJA
        set(LOJA,'Callback',@CallBackLOJA);
        function CallBackLOJA(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',0);
            set(LOJA,'Value',1);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Texto ENLACES AUSTRO
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.35 0.75 0.35 0.05],...
                'string','ENLACES TOTAL: 72',...
                'backgroundcolor',[0.941 0.941 0.941]);


            %Pie De Fechas Autorizacion
            PieSFWA = axes('Units','pixels',...
                'Position',[250,-170,800,800],...
                'Tag','PieSFWA');
            x = [6.96 93.04];
            labels = {'BANDA UTILIZADA 6.96%','BANDA LIBRE 93.94%'};
            pie3(x,labels);  
            
        end
        
             
        
        %ZAMORA CHINCHIPE
        ZAMORACHINCHIPE = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.54 0.12 0.04],...
            'string','ZAMORA CHINCHIPE',...
            'Tag','ZAMORACHINCHIPE',...
            'backgroundcolor',[0.941 0.941 0.941]);
        
        %CALLBACK Radio Button ZAMORA CHINCHIPE
        set(ZAMORACHINCHIPE,'Callback',@CallBackZAMORACHINCHIPE);
        function CallBackZAMORACHINCHIPE(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',0);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',1);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Texto ENLACES AUSTRO
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.35 0.75 0.35 0.05],...
                'string','ENLACES TOTAL: 50',...
                'backgroundcolor',[0.941 0.941 0.941]);


            %Pie De Fechas Autorizacion
            PieSFWA = axes('Units','pixels',...
                'Position',[250,-170,800,800],...
                'Tag','PieSFWA');
            x = [4.38 95.62];
            labels = {'BANDA UTILIZADA 4.38%','BANDA LIBRE 95.62%'};
            pie3(x,labels);              

        end
        
        %MORONA SANTIAGO
        MORONASANTIAGO = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.46 0.13 0.04],...
            'string','MORONA SANTIAGO',...
            'Tag','MORONASANTIAGO',...
            'backgroundcolor',[0.941 0.941 0.941]);

        %CALLBACK Radio Button MORONA SANTIAGO
        set(MORONASANTIAGO,'Callback',@CallBackMORONASANTIAGO);
        function CallBackMORONASANTIAGO(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',0);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',1);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Texto ENLACES AUSTRO
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.35 0.75 0.35 0.05],...
                'string','ENLACES TOTAL: 178',...
                'backgroundcolor',[0.941 0.941 0.941]);


            %Pie De Fechas Autorizacion
            PieSFWA = axes('Units','pixels',...
                'Position',[250,-170,800,800],...
                'Tag','PieSFWA');
            x = [16.83 83.17];
            labels = {'BANDA UTILIZADA 16.83%','BANDA LIBRE 83.17%'};
            pie3(x,labels);              

        end
                
               
    end
    
    
    VHFUHF = uicontrol(handles.PanelPantalla,...
        'style','radiobutton',...
        'units','normalized',...
        'fontsize',12,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.57 0.92 0.08 0.045],...
        'string','VHF-UHF',...
        'Tag','RB5',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %CALLBACK Radio Button VHF UHF
    set(VHFUHF,'Callback',@CallBackVHFUHF);
    function CallBackVHFUHF(source,eventdata)

        %Seleccion de la Tabla VHFUHF 
        Tabla = TablaVHFUHF;
        [filas columnas] = size(Tabla);
        
        %Poner los demas radioButtons como deseleccionados
        set(SIRATV,'Value',0);
        set(SCDMA,'Value',0);
        set(FWA,'Value',0);
        set(ENLACES,'Value',0);
        set(VHFUHF,'Value',1);
        set(MDBA,'Value',0);
        set(AUXILIARES,'Value',0);
        
        %BORRAR TODO DE LA PANTALLA
        HandlePanelPantalla = get(handles.PanelPantalla);
        for k = 1:length(HandlePanelPantalla.Children)
            child = get(HandlePanelPantalla.Children(k));
            tag = child.Tag;            
            switch tag
                case 'RB1'
                case 'RB2'
                case 'RB3'
                case 'RB4'
                case 'RB5'
                case 'RB6'
                case 'RB7'    
                otherwise
                    delete(HandlePanelPantalla.Children(k));
            end
        end
        HandleVentana = get(handles.figure1);
        for k = 1:length(HandleVentana.Children)
            child = get(HandleVentana.Children(k));
            tag = child.Tag;            
            switch tag
                case 'Enlaces'
                case 'EstacionesBase'
                case 'PanelPantalla'
                case 'uitoolbar3'
                case 'GrupoBaseDatos'
                otherwise
                    delete(HandleVentana.Children(k));
            end
        end
        
        
        %RADIO BUTTONS PARA SELECCIONAR CATEGORIA
        GrupoProvincias = uibuttongroup(...
            'visible','on',...
            'fontsize',10,...
            'FontName','Times New Roman',...
            'Position',[0.025 0.4 0.15 0.4],...
            'Title','PROVINCIAS',...
            'Tag', 'GrupoProvincias',...
            'backgroundcolor',[ 0.941 0.941 0.941]);
        
        %AZUAY        
        AZUAY = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.78 0.1 0.04],...
            'string','PRIVADOS',...
            'Tag','AZUAY',...
            'backgroundcolor',[0.941 0.941 0.941]);        
                 
        %CALLBACK Radio Button AZUAY
        set(AZUAY,'Callback',@CallBackAZUAY);
        function CallBackAZUAY(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',1);
            set(CANAR,'Value',0);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Texto ENLACES AUSTRO
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.35 0.75 0.35 0.05],...
                'string','ANCHO BANDA MHz. TOTAL: 2010',...
                'backgroundcolor',[0.941 0.941 0.941]);


            %Pie De Fechas Autorizacion
            PieSFWA = axes('Units','pixels',...
                'Position',[250,-170,800,800],...
                'Tag','PieSFWA');
            x = [79 3 1868 14 12 34];
            labels = {'6.25','12',...
                '12.5','25',...
                '37.5', 'Vacias'};
            pie3(x,labels);    
 
        end
        
        %CA�AR
        CANAR = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.7 0.1 0.04],...
            'string','EXPLOTACION',...
            'Tag','CANAR',...
            'backgroundcolor',[0.941 0.941 0.941]);

        %CALLBACK Radio Button CANAR
        set(CANAR,'Callback',@CallBackCANAR);
        function CallBackCANAR(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',1);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Texto ENLACES AUSTRO
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.35 0.75 0.35 0.05],...
                'string','ANCHO BANDA MHz. TOTAL: 359',...
                'backgroundcolor',[0.941 0.941 0.941]);


            %Pie De Fechas Autorizacion
            PieSFWA = axes('Units','pixels',...
                'Position',[250,-170,800,800],...
                'Tag','PieSFWA');
            x = [0 0 338 2 0 19];
            labels = {'6.25','12',...
                '12.5','25',...
                '37.5', 'Vacias'};
            pie3(x,labels);               

        end
        

        %LOJA
        LOJA = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.62 0.1 0.04],...
            'string','AERONAUTICO',...
            'Tag','LOJA',...
            'backgroundcolor',[0.941 0.941 0.941]);        
       
        %CALLBACK Radio Button LOJA
        set(LOJA,'Callback',@CallBackLOJA);
        function CallBackLOJA(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',0);
            set(LOJA,'Value',1);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Texto ENLACES AUSTRO
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.35 0.75 0.35 0.05],...
                'string','ANCHO BANDA MHz. TOTAL: 91',...
                'backgroundcolor',[0.941 0.941 0.941]);


            %Pie De Fechas Autorizacion
            PieSFWA = axes('Units','pixels',...
                'Position',[250,-170,800,800],...
                'Tag','PieSFWA');
            x = [78 0 2 11 0 0];
            labels = {'6.25','12',...
                '12.5','25',...
                '37.5', 'Vacias'};
            pie3(x,labels);                 

        end
        
             
        
        %ZAMORA CHINCHIPE
        ZAMORACHINCHIPE = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.54 0.12 0.04],...
            'string','VHF UHF',...
            'Tag','ZAMORACHINCHIPE',...
            'backgroundcolor',[0.941 0.941 0.941]);
        
        %CALLBACK Radio Button ZAMORA CHINCHIPE
        set(ZAMORACHINCHIPE,'Callback',@CallBackZAMORACHINCHIPE);
        function CallBackZAMORACHINCHIPE(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',0);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',1);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Texto ENLACES AUSTRO
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.35 0.75 0.35 0.05],...
                'string','ANCHO BANDA MHz. TOTAL: 2277',...
                'backgroundcolor',[0.941 0.941 0.941]);


            %Pie De Fechas Autorizacion
            PieSFWA = axes('Units','pixels',...
                'Position',[250,-170,800,800],...
                'Tag','PieSFWA');
            x = [0 3 2204 5 12 53];
            labels = {'6.25','12',...
                '12.5','25',...
                '37.5', 'Vacias'};
            pie3(x,labels);     

        end
        
        %MORONA SANTIAGO
        MORONASANTIAGO = uicontrol(handles.PanelPantalla,...
            'style','text',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.46 0.13 0.04],...
            'string','',...
            'Tag','MORONASANTIAGO',...
            'backgroundcolor',[0.941 0.941 0.941]);

       
    end 
    
    MDBA = uicontrol(handles.PanelPantalla,...
        'style','radiobutton',...
        'units','normalized',...
        'fontsize',12,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.72 0.92 0.06 0.045],...
        'string','MDBA',...
        'Tag','RB6',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %CALLBACK Radio Button MDBA
    set(MDBA,'Callback',@CallBackMDBA);
    function CallBackMDBA(source,eventdata)

        %Seleccion de la Tabla MDBA 
        Tabla = TablaMDBA;
        [filas columnas] = size(Tabla);

        %Poner los demas radioButtons como deseleccionados
        set(SIRATV,'Value',0);
        set(SCDMA,'Value',0);
        set(FWA,'Value',0);
        set(ENLACES,'Value',0);
        set( VHFUHF,'Value',0);
        set(MDBA,'Value',1);
        set(AUXILIARES,'Value',0);

        %BORRAR TODO DE LA PANTALLA
        HandlePanelPantalla = get(handles.PanelPantalla);
        for k = 1:length(HandlePanelPantalla.Children)
            child = get(HandlePanelPantalla.Children(k));
            tag = child.Tag;            
            switch tag
                case 'RB1'
                case 'RB2'
                case 'RB3'
                case 'RB4'
                case 'RB5'
                case 'RB6'
                case 'RB7'    
                otherwise
                    delete(HandlePanelPantalla.Children(k));
            end
        end
        HandleVentana = get(handles.figure1);
        for k = 1:length(HandleVentana.Children)
            child = get(HandleVentana.Children(k));
            tag = child.Tag;            
            switch tag
                case 'Enlaces'
                case 'EstacionesBase'
                case 'PanelPantalla'
                case 'uitoolbar3'
                case 'GrupoBaseDatos'
                otherwise
                    delete(HandleVentana.Children(k));
            end
        end

        %RADIO BUTTONS PARA SELECCIONAR CATEGORIA
        GrupoProvincias = uibuttongroup(...
            'visible','on',...
            'fontsize',10,...
            'FontName','Times New Roman',...
            'Position',[0.025 0.4 0.15 0.4],...
            'Title','PROVINCIAS',...
            'Tag', 'GrupoProvincias',...
            'backgroundcolor',[ 0.941 0.941 0.941]);

        %AZUAY        
        AZUAY = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.78 0.1 0.04],...
            'string','AZUAY',...
            'Tag','AZUAY',...
            'backgroundcolor',[0.941 0.941 0.941]);        

        %CALLBACK Radio Button AZUAY
        set(AZUAY,'Callback',@CallBackAZUAY);
        function CallBackAZUAY(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',1);
            set(CANAR,'Value',0);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);

            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end

            %Barras ANCHO BANDA
            l=cell(1,4);
            l{1}='Explotacion';
            l{2}='Privado';
            l{3}='Explot. Acceso a Red';
            l{4}='Vacias';
            
            valores=[4831 165 487 0];
            EspFrecAZUAYMDBA = axes('Units','pixels',...
                'Position',[350,50,300,400],...
                'Tag','EspFrecAZUAYMDBA');
            barh(valores,...
                'EdgeColor','b',...
                'FaceColor','b',...
                'BarWidth', 0.8);
            set(EspFrecAZUAYMDBA,'yticklabel', l); 
            grid on;

            
            %Texto CONCESIONARIOS 
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.23 0.8 0.3 0.05],...
                'string','TOTAL ENLACES MDBA: 5483',...
                'backgroundcolor',[0.941 0.941 0.941]);
 
            %Barras
            l=cell(1,6);
            l{1}='902-928';
            l{2}='2400-2483.5';
            l{3}='5150-5250';
            l{4}='5250-5350';            
            l{5}='5470-5725';
            l{6}='5725-5850';
            
            valores=[1 1790 261 67 2189 1197];
            EspValAZUAYMDBA = axes('Units','pixels',...
                'Position',[800,50,300,400],...
                'Tag','EspValAZUAYMDBA');
            barh(valores,...
                'EdgeColor','b',...
                'FaceColor','b',...
                'BarWidth', 0.8);
            set(EspValAZUAYMDBA,'yticklabel', l); 
            grid on;

            
            %Texto FRECUENCIAS 
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.63 0.8 0.33 0.05],...
                'string','RANGOS DE FRECUENCIAS MHz',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
        end

        %CA�AR
        CANAR = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.7 0.1 0.04],...
            'string','CA�AR',...
            'Tag','CANAR',...
            'backgroundcolor',[0.941 0.941 0.941]);

        %CALLBACK Radio Button CANAR
        set(CANAR,'Callback',@CallBackCANAR);
        function CallBackCANAR(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',1);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);

            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end


            %Barras ANCHO BANDA
            l=cell(1,4);
            l{1}='Explotacion';
            l{2}='Privado';
            l{3}='Explot. Acceso a Red';
            l{4}='Vacias';
            
            valores=[115 26 8 0];
            EspFrecMDBA = axes('Units','pixels',...
                'Position',[350,50,300,400],...
                'Tag','EspFrecMDBA');
            barh(valores,...
                'EdgeColor','g',...
                'FaceColor','g',...
                'BarWidth', 0.8);
            set(EspFrecMDBA,'yticklabel', l); 
            grid on;

            
            %Texto CONCESIONARIOS 
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.23 0.8 0.3 0.05],...
                'string','TOTAL ENLACES MDBA: 149',...
                'backgroundcolor',[0.941 0.941 0.941]);
 
            %Barras
            l=cell(1,6);
            l{1}='902-928';
            l{2}='2400-2483.5';
            l{3}='5150-5250';
            l{4}='5250-5350';            
            l{5}='5470-5725';
            l{6}='5725-5850';
            
            valores=[0 10 1 1 29 109];
            EspValMDBA = axes('Units','pixels',...
                'Position',[800,50,300,400],...
                'Tag','EspValMDBA');
            barh(valores,...
                'EdgeColor','g',...
                'FaceColor','g',...
                'BarWidth', 0.8);
            set(EspValMDBA,'yticklabel', l); 
            grid on;

            
            %Texto FRECUENCIAS 
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.63 0.8 0.33 0.05],...
                'string','RANGOS DE FRECUENCIAS MHz',...
                'backgroundcolor',[0.941 0.941 0.941]);
            

        end


        %LOJA
        LOJA = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.62 0.1 0.04],...
            'string','LOJA',...
            'Tag','LOJA',...
            'backgroundcolor',[0.941 0.941 0.941]);        

        %CALLBACK Radio Button LOJA
        set(LOJA,'Callback',@CallBackLOJA);
        function CallBackLOJA(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',0);
            set(LOJA,'Value',1);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);

            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Barras CLASIFICACION
            l=cell(1,4);
            l{1}='Explotacion';
            l{2}='Privado';
            l{3}='Explot. Acceso a Red';
            l{4}='Vacias';
            
            valores=[115 26 8 0];
            EspFrecMDBA = axes('Units','pixels',...
                'Position',[350,50,300,400],...
                'Tag','EspFrecMDBA');
            barh(valores,...
                'EdgeColor','k',...
                'FaceColor','k',...
                'BarWidth', 0.8);
            set(EspFrecMDBA,'yticklabel', l); 
            grid on;

            %Texto CONCESIONARIOS 
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.23 0.8 0.3 0.05],...
                'string','TOTAL ENLACES MDBA: 149',...
                'backgroundcolor',[0.941 0.941 0.941]);
 
            %Barras ANCHO BANDA
            l=cell(1,6);
            l{1}='902-928';
            l{2}='2400-2483.5';
            l{3}='5150-5250';
            l{4}='5250-5350';            
            l{5}='5470-5725';
            l{6}='5725-5850';
            
            valores=[0 79 20 28 102 317];
            EspValMDBA = axes('Units','pixels',...
                'Position',[800,50,300,400],...
                'Tag','EspValMDBA');
            barh(valores,...
                'EdgeColor','k',...
                'FaceColor','k',...
                'BarWidth', 0.8);
            set(EspValMDBA,'yticklabel', l); 
            grid on;
         
            %Texto FRECUENCIAS 
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.63 0.8 0.33 0.05],...
                'string','RANGOS DE FRECUENCIAS MHz',...
                'backgroundcolor',[0.941 0.941 0.941]);
       
        end



        %ZAMORA CHINCHIPE
        ZAMORACHINCHIPE = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.54 0.12 0.04],...
            'string','ZAMORA CHINCHIPE',...
            'Tag','ZAMORACHINCHIPE',...
            'backgroundcolor',[0.941 0.941 0.941]);

        %CALLBACK Radio Button ZAMORA CHINCHIPE
        set(ZAMORACHINCHIPE,'Callback',@CallBackZAMORACHINCHIPE);
        function CallBackZAMORACHINCHIPE(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',0);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',1);
            set(MORONASANTIAGO,'Value',0);

            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end

            %Barras CLASIFICACION
            l=cell(1,4);
            l{1}='Explotacion';
            l{2}='Privado';
            l{3}='Explot. Acceso a Red';
            l{4}='Vacias';
            
            valores=[103 15 0 0];
            EspFrecMDBA = axes('Units','pixels',...
                'Position',[350,50,300,400],...
                'Tag','EspFrecMDBA');
            barh(valores,...
                'EdgeColor','c',...
                'FaceColor','c',...
                'BarWidth', 0.8);
            set(EspFrecMDBA,'yticklabel', l); 
            grid on;

            %Texto CONCESIONARIOS 
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.23 0.8 0.3 0.05],...
                'string','TOTAL ENLACES MDBA: 118',...
                'backgroundcolor',[0.941 0.941 0.941]);
 
            %Barras ANCHO BANDA
            l=cell(1,6);
            l{1}='902-928';
            l{2}='2400-2483.5';
            l{3}='5150-5250';
            l{4}='5250-5350';            
            l{5}='5470-5725';
            l{6}='5725-5850';
            
            valores=[0 11 1 3 15 32];
            EspValMDBA = axes('Units','pixels',...
                'Position',[800,50,300,400],...
                'Tag','EspValMDBA');
            barh(valores,...
                'EdgeColor','c',...
                'FaceColor','c',...
                'BarWidth', 0.8);
            set(EspValMDBA,'yticklabel', l); 
            grid on;
         
            %Texto FRECUENCIAS 
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.63 0.8 0.33 0.05],...
                'string','RANGOS DE FRECUENCIAS MHz',...
                'backgroundcolor',[0.941 0.941 0.941]);

        end

        %MORONA SANTIAGO
        MORONASANTIAGO = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.46 0.13 0.04],...
            'string','MORONA SANTIAGO',...
            'Tag','MORONASANTIAGO',...
            'backgroundcolor',[0.941 0.941 0.941]);

        %CALLBACK Radio Button MORONA SANTIAGO
        set(MORONASANTIAGO,'Callback',@CallBackMORONASANTIAGO);
        function CallBackMORONASANTIAGO(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',0);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',1);

            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end

            %Barras CLASIFICACION
            l=cell(1,4);
            l{1}='Explotacion';
            l{2}='Privado';
            l{3}='Explot. Acceso a Red';
            l{4}='Vacias';
            
            valores=[36 26 0 0];
            EspFrecMDBA = axes('Units','pixels',...
                'Position',[350,50,300,400],...
                'Tag','EspFrecMDBA');
            barh(valores,...
                'EdgeColor','m',...
                'FaceColor','m',...
                'BarWidth', 0.8);
            set(EspFrecMDBA,'yticklabel', l); 
            grid on;

            %Texto CONCESIONARIOS 
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.23 0.8 0.3 0.05],...
                'string','TOTAL ENLACES MDBA: 62',...
                'backgroundcolor',[0.941 0.941 0.941]);
 
            %Barras ANCHO BANDA
            l=cell(1,6);
            l{1}='902-928';
            l{2}='2400-2483.5';
            l{3}='5150-5250';
            l{4}='5250-5350';            
            l{5}='5470-5725';
            l{6}='5725-5850';
            
            valores=[0 11 1 3 15 32];
            EspValMDBA = axes('Units','pixels',...
                'Position',[800,50,300,400],...
                'Tag','EspValMDBA');
            barh(valores,...
                'EdgeColor','m',...
                'FaceColor','m',...
                'BarWidth', 0.8);
            set(EspValMDBA,'yticklabel', l); 
            grid on;
         
            %Texto FRECUENCIAS 
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.63 0.8 0.33 0.05],...
                'string','RANGOS DE FRECUENCIAS MHz',...
                'backgroundcolor',[0.941 0.941 0.941]);

        end

        %Texto CONCESIONARIOS 
        ConsAust= uicontrol(handles.PanelPantalla,...
            'style','text',...
            'fontWeight','bold',...
            'units','normalized',...
            'HorizontalAlignment','center',...
            'fontsize',17,...
            'position',[ 0.2 0.75 0.35 0.1],...
            'string','CONCESIONARIOS EN EL AUSTRO DEL PAIS',...
            'backgroundcolor',[0.941 0.941 0.941]);
            
            
        %Pie De Fechas Autorizacion
        PieSFWA = axes('Units','pixels',...
            'Position',[200,10,500,500],...
            'Tag','PieSFWA');
        x = [5 87 8];
        labels = {'Privado 5%','Explotacion 87%','Explotacion de Acceso a Red 8%'};
        pie3(x,labels);   
        
        
        %Texto CONCESIONARIOS 
        ConsAust= uicontrol(handles.PanelPantalla,...
            'style','text',...
            'fontWeight','bold',...
            'units','normalized',...
            'HorizontalAlignment','center',...
            'fontsize',17,...
            'position',[ 0.6 0.75 0.35 0.1],...
            'string','CONCESION DEL ANCHO DE BANDA ASIGNADO',...
            'backgroundcolor',[0.941 0.941 0.941]);
            
            
        %Pie De Fechas Autorizacion
        PieSFWA = axes('Units','pixels',...
            'Position',[650,10,500,500],...
            'Tag','PieSFWA');
        x = [4 37 30 2 27];
        labels = {'5150-5250 4%','5470-5725 37%',...
            '2400-2483.5 30%', '5250-5350 2%', '5725-5850 27%'};
        pie3(x,labels);    

    end


    
    AUXILIARES = uicontrol(handles.PanelPantalla,...
        'style','radiobutton',...
        'units','normalized',...
        'fontsize',12,...
        'fontWeight','bold',...
        'FontName', 'Times New Roman',...
        'HorizontalAlignment','left',...
        'position',[ 0.84 0.92 0.1 0.045],...
        'string','AUXILIARES',...
        'Tag','RB7',...
        'backgroundcolor',[0.941 0.941 0.941]);
    
    %CALLBACK Radio Button AUXILIARES
    set(AUXILIARES,'Callback',@CallBackAuxiliares);
    function CallBackAuxiliares(source,eventdata)
        
        %Seleccion de la Tabla VHFUHF 
        Tabla = TablaAuxiliares;
        [filas columnas] = size(Tabla);
        
        %Poner los demas radioButtons como deseleccionados
        set(SIRATV,'Value',0);
        set(SCDMA,'Value',0);
        set(FWA,'Value',0);
        set(ENLACES,'Value',0);
        set(VHFUHF,'Value',0);
        set(MDBA,'Value',0);
        set(AUXILIARES,'Value',1);
        
        %BORRAR TODO DE LA PANTALLA
        HandlePanelPantalla = get(handles.PanelPantalla);
        for k = 1:length(HandlePanelPantalla.Children)
            child = get(HandlePanelPantalla.Children(k));
            tag = child.Tag;            
            switch tag
                case 'RB1'
                case 'RB2'
                case 'RB3'
                case 'RB4'
                case 'RB5'
                case 'RB6'
                case 'RB7'    
                otherwise
                    delete(HandlePanelPantalla.Children(k));
            end
        end
        HandleVentana = get(handles.figure1);
        for k = 1:length(HandleVentana.Children)
            child = get(HandleVentana.Children(k));
            tag = child.Tag;            
            switch tag
                case 'Enlaces'
                case 'EstacionesBase'
                case 'PanelPantalla'
                case 'uitoolbar3'
                case 'GrupoBaseDatos'
                otherwise
                    delete(HandleVentana.Children(k));
            end
        end
        
        
        %RADIO BUTTONS PARA SELECCIONAR CATEGORIA
        GrupoProvincias = uibuttongroup(...
            'visible','on',...
            'fontsize',10,...
            'FontName','Times New Roman',...
            'Position',[0.025 0.4 0.15 0.4],...
            'Title','PROVINCIAS',...
            'Tag', 'GrupoProvincias',...
            'backgroundcolor',[ 0.941 0.941 0.941]);
        
        %AZUAY        
        AZUAY = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.78 0.1 0.04],...
            'string','AZUAY',...
            'Tag','AZUAY',...
            'backgroundcolor',[0.941 0.941 0.941]);        
                 
        %CALLBACK Radio Button AZUAY
        set(AZUAY,'Callback',@CallBackAZUAY);
        function CallBackAZUAY(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',1);
            set(CANAR,'Value',0);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
            %Barras ANCHO BANDA
            l=cell(1,6);
            l{1}='222-235';
            l{2}='246-248';
            l{3}='417.5-430';
            l{4}='937-940';            
            l{5}='941-951';
            l{6}='956-960';
            l{7}='1670-1690';
            
            valores=[46 0 15 0 23 1 0];
            EspValMDBA = axes('Units','pixels',...
                'Position',[350,50,650,400],...
                'Tag','EspValMDBA');
            barh(valores,...
                'EdgeColor','b',...
                'FaceColor','b',...
                'BarWidth', 0.8);
            set(EspValMDBA,'yticklabel', l); 
            grid on;
         
            %Texto FRECUENCIAS 
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.35 0.8 0.35 0.05],...
                'string','RANGOS DE FRECUENCIAS MHz',...
                'backgroundcolor',[0.941 0.941 0.941]);
            
        end
        
        %CA�AR
        CANAR = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.7 0.1 0.04],...
            'string','CA�AR',...
            'Tag','CANAR',...
            'backgroundcolor',[0.941 0.941 0.941]);

        %CALLBACK Radio Button CANAR
        set(CANAR,'Callback',@CallBackCANAR);
        function CallBackCANAR(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',1);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
                
            %Barras ANCHO BANDA
            l=cell(1,6);
            l{1}='222-235';
            l{2}='246-248';
            l{3}='417.5-430';
            l{4}='937-940';            
            l{5}='941-951';
            l{6}='956-960';
            l{7}='1670-1690';
            
            valores=[18 0 1 2 15 0 0];
            EspValMDBA = axes('Units','pixels',...
                'Position',[350,50,650,400],...
                'Tag','EspValMDBA');
            barh(valores,...
                'EdgeColor','g',...
                'FaceColor','g',...
                'BarWidth', 0.8);
            set(EspValMDBA,'yticklabel', l); 
            grid on;
         
            %Texto FRECUENCIAS 
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.35 0.8 0.35 0.05],...
                'string','RANGOS DE FRECUENCIAS MHz',...
                'backgroundcolor',[0.941 0.941 0.941]);      
            
        end
        

        %LOJA
        LOJA = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',10,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.62 0.1 0.04],...
            'string','LOJA',...
            'Tag','LOJA',...
            'backgroundcolor',[0.941 0.941 0.941]);        
       
        %CALLBACK Radio Button LOJA
        set(LOJA,'Callback',@CallBackLOJA);
        function CallBackLOJA(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',0);
            set(LOJA,'Value',1);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            
 
            %Barras ANCHO BANDA
            l=cell(1,6);
            l{1}='222-235';
            l{2}='246-248';
            l{3}='417.5-430';
            l{4}='937-940';            
            l{5}='941-951';
            l{6}='956-960';
            l{7}='1670-1690';
            
            valores=[50 0 19 3 21 1 0];
            EspValMDBA = axes('Units','pixels',...
                'Position',[350,50,650,400],...
                'Tag','EspValMDBA');
            barh(valores,...
                'EdgeColor','k',...
                'FaceColor','k',...
                'BarWidth', 0.8);
            set(EspValMDBA,'yticklabel', l); 
            grid on;
         
            %Texto FRECUENCIAS 
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.35 0.8 0.35 0.05],...
                'string','RANGOS DE FRECUENCIAS MHz',...
                'backgroundcolor',[0.941 0.941 0.941]);
        end
        
             
        
        %ZAMORA CHINCHIPE
        ZAMORACHINCHIPE = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.54 0.12 0.04],...
            'string','ZAMORA CHINCHIPE',...
            'Tag','ZAMORACHINCHIPE',...
            'backgroundcolor',[0.941 0.941 0.941]);
        
        %CALLBACK Radio Button ZAMORA CHINCHIPE
        set(ZAMORACHINCHIPE,'Callback',@CallBackZAMORACHINCHIPE);
        function CallBackZAMORACHINCHIPE(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',0);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',1);
            set(MORONASANTIAGO,'Value',0);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            

            %Barras ANCHO BANDA
            l=cell(1,6);
            l{1}='222-235';
            l{2}='246-248';
            l{3}='417.5-430';
            l{4}='937-940';            
            l{5}='941-951';
            l{6}='956-960';
            l{7}='1670-1690';
            
            valores=[29 0 0 0 21 0 0];
            EspValMDBA = axes('Units','pixels',...
                'Position',[350,50,650,400],...
                'Tag','EspValMDBA');
            barh(valores,...
                'EdgeColor','c',...
                'FaceColor','c',...
                'BarWidth', 0.8);
            set(EspValMDBA,'yticklabel', l); 
            grid on;
         
            %Texto FRECUENCIAS 
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.35 0.8 0.35 0.05],...
                'string','RANGOS DE FRECUENCIAS MHz',...
                'backgroundcolor',[0.941 0.941 0.941]);            
          
        end
        
        %MORONA SANTIAGO
        MORONASANTIAGO = uicontrol(handles.PanelPantalla,...
            'style','radiobutton',...
            'units','normalized',...
            'fontsize',9,...
            'fontWeight','bold',...
            'FontName', 'Times New Roman',...
            'HorizontalAlignment','left',...
            'position',[ 0.03 0.46 0.13 0.04],...
            'string','MORONA SANTIAGO',...
            'Tag','MORONASANTIAGO',...
            'backgroundcolor',[0.941 0.941 0.941]);

        %CALLBACK Radio Button MORONA SANTIAGO
        set(MORONASANTIAGO,'Callback',@CallBackMORONASANTIAGO);
        function CallBackMORONASANTIAGO(source1,eventdata)
            %Poner los demas radioButtons como deseleccionados
            set(AZUAY,'Value',0);
            set(CANAR,'Value',0);
            set(LOJA,'Value',0);
            set(ZAMORACHINCHIPE,'Value',0);
            set(MORONASANTIAGO,'Value',1);
                        
            %Limpiar la Pantalla
            HandlePanelPantalla = get(handles.PanelPantalla);
            for k = 1:length(HandlePanelPantalla.Children)
                child = get(HandlePanelPantalla.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'RB1'
                    case 'RB2'
                    case 'RB3'
                    case 'RB4'
                    case 'RB5'
                    case 'RB6'
                    case 'RB7'
                    case 'AM'
                    case 'FM'
                    case 'AZUAY'
                    case 'CANAR'
                    case 'LOJA'
                    case 'ZAMORACHINCHIPE'
                    case 'MORONASANTIAGO'
                    otherwise
                        delete(HandlePanelPantalla.Children(k));
                end
            end
            HandleVentana = get(handles.figure1);
            for k = 1:length(HandleVentana.Children)
                child = get(HandleVentana.Children(k));
                tag = child.Tag;            
                switch tag
                    case 'Enlaces'
                    case 'EstacionesBase'
                    case 'PanelPantalla'
                    case 'uitoolbar3'
                    case 'GrupoBaseDatos'
                    case 'GrupoProvincias'
                    otherwise
                        delete(HandleVentana.Children(k));
            end
            end
            

            %Barras ANCHO BANDA
            l=cell(1,6);
            l{1}='222-235';
            l{2}='246-248';
            l{3}='417.5-430';
            l{4}='937-940';            
            l{5}='941-951';
            l{6}='956-960';
            l{7}='1670-1690';
            
            valores=[29 0 0 0 21 0 0];
            EspValMDBA = axes('Units','pixels',...
                'Position',[350,50,650,400],...
                'Tag','EspValMDBA');
            barh(valores,...
                'EdgeColor','m',...
                'FaceColor','m',...
                'BarWidth', 0.8);
            set(EspValMDBA,'yticklabel', l); 
            grid on;
         
            %Texto FRECUENCIAS 
            ConsAust= uicontrol(handles.PanelPantalla,...
                'style','text',...
                'fontWeight','bold',...
                'units','normalized',...
                'HorizontalAlignment','center',...
                'fontsize',17,...
                'position',[ 0.35 0.8 0.35 0.05],...
                'string','RANGOS DE FRECUENCIAS MHz',...
                'backgroundcolor',[0.941 0.941 0.941]);
           
        end        

        %Texto ENLACES AUSTRO
        ConsAust= uicontrol(handles.PanelPantalla,...
            'style','text',...
            'fontWeight','bold',...
            'units','normalized',...
            'HorizontalAlignment','center',...
            'fontsize',17,...
            'position',[ 0.4 0.75 0.35 0.05],...
            'string','ENLACES TOTAL AUSTRO: 446',...
            'backgroundcolor',[0.941 0.941 0.941]);
            
            
        %Pie De Fechas Autorizacion
        PieSFWA = axes('Units','pixels',...
            'Position',[250,-170,800,800],...
            'Tag','PieSFWA');
        x = [102 78 65 129 42 30];
        labels = {'AZUAY 102','CA�AR 78',...
            'EL ORO 65', 'LOJA 129',...
            'MORONA SANTIAGO 42', 'ZAMORA CHINCHIPE 30'};
        pie3(x,labels);
        
    end   
    
    
    BasesDeDatos = uibuttongroup(...
        'Tag','GrupoBaseDatos',...
        'visible','on',...
        'fontsize',10,...
        'FontName','Times New Roman',...
        'Position',[0.02 0.85 0.95 0.08],...
        'Title','BASES DE DATOS',...
        'backgroundcolor',[ 0.941 0.941 0.941]);
    
    
    
end

% MENU ANALISIS
function EstacionesBase_Callback(hObject, eventdata, handles)
end

%MENU ENLACES
function Enlaces_Callback(hObject, eventdata, handles)
set(handles.PanelPantalla,'Title','Enlaces');
end

%%%%%%%%%% SET DE FUNCIONES %%%%%%%%%%%

%FUNCION PARA LEER LONGITUD Y LATITUD
function [valorGrados] = conversionGrados(valor)
    stringValor = valor;
    horas = 1;
    minutos = 0;
    segundos = 0;
    horastringValor = 0;
    minutostringValor = 0;
    segundosstringValor = 0;
    condicion1 = 0;
    condicion2 = 0;
    condicion3 = 0;
    signo = 0;

    for i=1:1:(length(stringValor))

        if(condicion1 == 1)
                minutos = 1;
        end

        if(condicion2 == 1)
                segundos = 1;
        end

        if(condicion3 == 1)
                if(stringValor(i) == 'N')
                    signo = 1;
                end
                if(stringValor(i) == 'S')
                    signo = -1;
                end
                if(stringValor(i) == 'E')
                    signo = 1;
                end
                if(stringValor(i) == 'W')
                    signo = -1;
                end        
        end


        if(horas == 1)
                if(stringValor(i) == '�' || stringValor(i) == '?')
                    horas = 0;
                    condicion1 = 1;
                else   
                    horastringValor = strcat(horastringValor,stringValor(i));
                end
        end

        if(minutos == 1)
                if(stringValor(i) == '''')
                    minutos = 0;
                    condicion1 = 0;
                    condicion2 = 1;

                else   
                    minutostringValor = strcat(minutostringValor,stringValor(i));
                end
        end        

        if(segundos == 1)
                if(stringValor(i) == ',')
                    stringValor(i) = '.';
                end

                if(stringValor(i) == '"')
                    condicion2 = 0;
                    condicion3 = 1;
                    segundos = 0;
                else   
                    segundosstringValor = strcat(segundosstringValor,stringValor(i));
                end
        end  
    end 
    valorGrados = signo*((str2double(horastringValor))+(str2double(minutostringValor)/60)+(str2double(segundosstringValor)/3600));
end

%FUNCION PARA CALCULAR DISTANCIA Y AZIMUTS
function [Distancia, atr, art] = distancia_azimut(xt, xr, yt, yr)
% Funcion que ayuda a obtener la distancia entre las antenas y los angulos azimut del enlace.   
Distancia = 111.18*acosd(sind(xt)*sind(xr)+cosd(xt)*cosd(xr)*cosd(yr-yt));
%Devuelve el valor de la distancia entre las dos antenas en kilometros 
Dprima = Distancia/111.18;
azitxrx = acosd((sind(xr)-(cosd(Dprima)*sind(xt)))/(sind(Dprima)*cosd(xt)));
azirxtx = acosd((sind(xt)-(cosd(Dprima)*sind(xr)))/(sind(Dprima)*cosd(xr)));
    if(sind(yr-yt)<0)
        art = azirxtx;
        atr = 360 - azitxrx;
        else
            atr = azitxrx;
            art = 360 - azirxtx; 
    end
end

function [vectorDistancias, vectorAlturasCorregidas] = perfilTopografico(auxXT, auxYT, auxXR, auxYR, distanciaEnlace)

%Declaramos las variables que se utilizaran para la correcion de las altura.
k = 4/3;
r0 = 6371;

%Nos comunicamos con el API que no respondera las correspondientes altura para el perfil topografico.
urlApiElevations='http://maps.googleapis.com/maps/api/elevation/json?path=';

%Convertimos el valor de las longitudes y latitudes a String.
xt = num2str(auxXT); 
yt = num2str(auxYT);
xr = num2str(auxXR);
yr = num2str(auxYR);
%Escogemos el numero de muestra (altura) que deseamos solicitar.
numMuestras = 100;
numeroMuestras = num2str(numMuestras);
%Concatenamos el URL para la correspondiente solicitud.
url = strcat(urlApiElevations,xt,',',yt,'|',xr,',',yr,'&samples=',numeroMuestras,'&sensor=false');
results = parse_json2(urlread(url));
vectorAlturasCorregidas(1) = results.results{1}.elevation;
vectorAlturas(1) = results.results{1}.elevation;
tamanoPaso = (distanciaEnlace*1000)/(numMuestras-1);

%Empezamos a almacenar en un array cada una de las distancias multiples del tamano de paso.
for i=1:1:numMuestras
    vectorDistancias(i) = tamanoPaso*(i-1);
end

%Empezamos a almacenar en un vector tanto las alturas originales, y las corregidas.
for i=1:numMuestras
    vectorAlturas(i) = results.results{i}.elevation;
    vectorAlturasCorregidas(i) = vectorAlturas(i) + vectorDistancias(i)*((distanciaEnlace * 1000) - vectorDistancias(i))/(2*k*r0*1000);
end
end

function [vectorAlturasLOS puntosFresnelSuperior puntosClearFresnelSuperior puntosFresnelInferior puntosClearFresnelInferior vectorFresnel perdidasDifraccion] = analisisFresnel(vectorDistancias,vectorAlturasCorregidas,frecuencia,alturaTransmisora,alturaReceptora)

%Obtenemos las lontitudes del vectorDistancia y del numero de las alturas corregidas.
extVectorDistancias = length(vectorDistancias);
extVectorAltCooregidas = length(vectorAlturasCorregidas);
distanciaEnlace = vectorDistancias(extVectorDistancias);
lambda = 3*10^8/(frecuencia*10^9);
auxiliar = 0;

%Obtenemos la ecuacion de la recta de describe LOS.
%Obtenemos primero la pendiente.
m = ((vectorAlturasCorregidas(extVectorAltCooregidas)+alturaReceptora)-(vectorAlturasCorregidas(1)+alturaTransmisora))/(distanciaEnlace);
for i=1:1:extVectorDistancias
    vectorAlturasLOS(i) = (m * vectorDistancias(i))+(alturaTransmisora + vectorAlturasCorregidas(1));
    vectorDespejamiento(i)= (vectorAlturasCorregidas(i)-vectorAlturasLOS(i));
end

%Calculo de la Primera Zona de Fresnel.
for i=1:1:(length(vectorDistancias))
    d1 = vectorDistancias(i);
    d2 = distanciaEnlace - d1;
    hn(i)=(sqrt((lambda*d1*d2)/(d1+d2)));
    puntosFresnelInferior(i) = vectorAlturasLOS(i) - hn(i);
    puntosFresnelSuperior(i) = vectorAlturasLOS(i) + hn(i);
    clearhn(i) = hn(i)*0.6;
    puntosClearFresnelInferior(i) = vectorAlturasLOS(i) - clearhn(i);
    puntosClearFresnelSuperior(i) = vectorAlturasLOS(i) + clearhn(i);

    %Almacenamos en el vectorFresnel, la observacion de si se ha cumplido o no con un 60% limpio d ela Primer Zona de Fresnel.
    if (abs(vectorDespejamiento(i)) > clearhn(i)) 
        vectorFresnel{i} = 'SI';
        aux_Vector_Despejamiento(i) = 0; 
    else
        vectorFresnel{i} = 'NO';
        aux_Vector_Despejamiento(i) = vectorDespejamiento(i);
    end
    
end

aux_Vector_Despejamiento(aux_Vector_Despejamiento==0) = [];
aux_Vector_Despejamiento(aux_Vector_Despejamiento>0) = [];
min_Despejamiento = min(abs(aux_Vector_Despejamiento));

posicion = 0;
for k=1:1:length(vectorDespejamiento)
    if(vectorDespejamiento(k) == (-1)*min_Despejamiento)
        posicion = k;
    end  
end

if(posicion ~= 0)
d1 = vectorDistancias(posicion);
d2 = distanciaEnlace - d1;
            %Calculo de las perdidas por difraccion.
            v = (-1)*min_Despejamiento * sqrt((2*(d1+d2))/(d1*d2*lambda));

            if v<=-1
                perdidasDifraccion = 0;
            end

            if v>=-1 && v<=0
                perdidasDifraccion = abs(20*(log(0.5-0.62*v)/log(10)));
            end

            if v>=0 && v<=1
                perdidasDifraccion = abs(20*(log(0.5*exp(-0.95*v))/log(10)));
            end

            if v>=1 && v<=2.4
                perdidasDifraccion = abs(20*(log(0.4-sqrt(0.1184-(0.38-0.1*v)^2))/log(10)));
            end

            if v>=2.4 
                perdidasDifraccion = abs(20*(log(0.225/v)));
            end
else
                perdidasDifraccion = 0;
end

    
end

%FUNCION PARA CALCULAR PERDIDAS POR MULTITRAYECTO
function [p ep] = LMP(htx, hrx, d, A, f, dn1)
%htx: altura de la torre transmisora
%hrx: altura de la torre receptora
%d: distancia del enlace
%A: figura de ruido
%f:frecuencia en GHz
%Esta funcion nos devuelve la probabilidad de tener desvanecimiento en el 
%camino por perdidas por multitrayectoria.
%Tambien nos proporciona informacion sobre (ep).

%Obtenemos un valor de k = 239.883291902*10^-6, si dN1 0 -200 dB; 
k = 10^(-4.2-0.0029*(dn1));
ep = abs((htx-hrx)/d);
%Tomamos la altura de menor valor.
hl = min([htx,hrx]);
%Con estos datos procemos a obtener la probabilidad deseada.
p = k*(d^3.0)*((1+ep)^-1.2)*10^(0.033*f - 0.001*hl- (A/10));
    
end

%FUNCION PARA CALCULAR LA ATENUACION ATMOSFERICA ATMOSFERICAS
function [Latmos] = Latmosf(f,p,d)
%Esta funcion nos devuelve la atenucion atmosferica con parametros de
%Frecuencia GHz y distancia Km
    Yo = (0.00719 + ((6.09)/(f^2 + 0.227)) + ((4.81)/((f-57)^2 + 1.5)))*(f^2)*(0.001);                                               %Perdidas por Oxigeno.
    Yw = (0.05+(0.0021*p) + ((3.5)/((f-22.2)^2 + 8.5)) + ((10.6)/((f-183.3)^2 + 9)) + ((8.9)/((f-325.4)^2 + 26.3)))*p*(f^2)*(0.0001);      %Perdidas por Agua.    
    Ya = Yo + Yw;
    Latmos = Ya*d;
end

%FUNCION PARA CALCULAR PERDIDAS POR NIEBLA Y NUBES
function [A]= Lnubes(f, ep, temp, condicion)
%Esta funcion nos permite obtener las perdidas por niebla y nubes, con los
%parametros de frecuencia en GHz y ep.
THETA = 300/temp;
E1 = 5.48; 
E2 = 3.51;
E0 = 77.6 + 103.3*(THETA-1);
fp = 20.09 - 142*(THETA-1) + (294*(THETA-1)^2);       %GHz
fs = 590 - 1500*(THETA-1);                            %GHz
Eprima = (E0-E1)/(1+(f/fp)^2)+(E1-E2)/(1+(f/fs)^2)+E2;
E2prima = (f*(E0-E1)/(fp*(1+((f/fp)^2)))) + (f*(E1-E2)/(fs*(1+((f/fs)^2))));
n = ((2+Eprima)/(E2prima));
KL = ((0.819*f)/(E2prima*(1+(n^2))));
if condicion == 1
    eprad = ep;
end
if condicion ==2
    eprad = ep*0.001;
end
A = ((1.6*KL)/sin(eprad));
%OJO EL SENO EN RADIANES 
end

function [k,alpha] = coef_reg(ep, f, pol)

%ep en mrad
%f en Ghz
%1- polarizacion horizontal
%2- polarizacion vertical
%3- polarizacion circular
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

t=pi/4;

    [num]=xlsread('coeficientes.xlsx');

    for i=1:1:length(num)
        if f>num(i,1) && f<num(i+1,1)
            f1 = num(i,1);
            f2 = num(i+1,1);

            k1h = num(i,2);
            k2h = num(i+1,2);

            a1h = num(i,3);
            a2h = num(i+1,3);

            k1v = num(i,4);
            k2v = num(i+1,4);

            a1v = num(i,5);
            a2v = num(i+1,5);

            kh=10^( log10(k2h) - ( (  log10(k2h/k1h)*log10(f2/f)  )/( log10(f2/f1) ) ) );
            ah=a2h-( (a2h-a1h) * (log10(f2/f) / log10(f2/f1)) );

            kv=10^(log10(k2v)- ( (  log10(k2v/k1v)*log10(f2/f)  )/( log10(f2/f1) ) ) );
            av=a2v-( (a2v-a1v) * (log10(f2/f) / log10(f2/f1)) );
            i=length(num)-1;

        end
        if f == num(i,1)

                kh= num(i,2);
                ah = num(i,3);
                kv = num(i,4);
                av = num(i,5);        
                i=length(num);
        end
    %se debe de sacar una alerta si hay frecuencias mayores
    end

if pol == 3
    
k=(kh+kv+(kh-kv)*((cos(ep/1000))^2)*cos(2*t))/2;
alpha=(kh*ah+kv*av+(kh*ah-kv*av)*((cos(ep/1000))^2)*cos(2*t))/(2*k);

end

if pol == 2

    k = kv;
    alpha = av;
    
end

if pol == 1

    k = kh;
    alpha = ah;
    
end

end

%FUNCION PARA CALCULAR PIRE
function [PIRE]= pire(PotTx, LTx, GTx, LranTx)
    PIRE = PotTx - LTx + GTx - LranTx;
end

function [valorDecimal] = conversionDecimal(valorString)
    for i=1:1:length(valorString)
        if(valorString(i) == ',')
            valorString(i) = '.';
        end
    end
    valorDecimal = str2double(valorString);
end

%COEFICIENTES
function [k,alpha] = coef_reg( ep, f, pol )

%ep en mrad
%f en Ghz
%1- polarizacion horizontal
%2- polarizacion vertical
%3- polarizacion circular
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

t=pi/4;

    [num]=xlsread('coeficientes.xlsx');

    for i=1:1:length(num)
        if f>num(i,1) && f<num(i+1,1)
            f1 = num(i,1);
            f2 = num(i+1,1);

            k1h = num(i,2);
            k2h = num(i+1,2);

            a1h = num(i,3);
            a2h = num(i+1,3);

            k1v = num(i,4);
            k2v = num(i+1,4);

            a1v = num(i,5);
            a2v = num(i+1,5);

            kh=10^( log10(k2h) - ( (  log10(k2h/k1h)*log10(f2/f)  )/( log10(f2/f1) ) ) );
            ah=a2h-( (a2h-a1h) * (log10(f2/f) / log10(f2/f1)) );

            kv=10^(log10(k2v)- ( (  log10(k2v/k1v)*log10(f2/f)  )/( log10(f2/f1) ) ) );
            av=a2v-( (a2v-a1v) * (log10(f2/f) / log10(f2/f1)) );
            i=length(num)-1;

        end
        if f == num(i,1)

                kh= num(i,2);
                ah = num(i,3);
                kv = num(i,4);
                av = num(i,5);        
                i=length(num);
        end
    %se debe de sacar una alerta si hay frecuencias mayores
    end

if pol == 3
    
k=(kh+kv+(kh-kv)*((cos(ep/1000))^2)*cos(2*t))/2;
alpha=(kh*ah+kv*av+(kh*ah-kv*av)*((cos(ep/1000))^2)*cos(2*t))/(2*k);

end

if pol == 2

    k = kv;
    alpha = av;
    
end

if pol == 1

    k = kh;
    alpha = ah;
    
end

end

%MAPA GOOGLE
function varargout = plot_google_map(varargin)
    % function h = plot_google_map(varargin)
    % Plots a google map on the current axes using the Google Static Maps API
    %
    % USAGE:
    % h = plot_google_map(Property, Value,...)
    % Plots the map on the given axes. Used also if no output is specified
    %
    % Or:
    % [lonVec latVec imag] = plot_google_map(Property, Value,...)
    % Returns the map without plotting it
    %
    % PROPERTIES:
    %    Height (640)   - Height of the image in pixels (max 640)
    %    Width  (640)   - Width of the image in pixels (max 640)
    %    Scale (2)      - (1/2) Resolution scale factor . using Scale=2 will
    %                     double the resulotion of the downloaded image (up
    %                     to 1280x1280) and will result in finer rendering,
    %                     but processing time will be longer.
    %    MapType        - ('roadmap') Type of map to return. Any of [roadmap, 
    %                     satellite, terrain, hybrid] See the Google Maps API for
    %                     more information. 
    %    Alpha (1)      - (0-1) Transparency level of the map (0 is fully
    %                     transparent). While the map is always
    %                     moved to the bottom of the plot (i.e. will
    %                     not hide previously drawn items), this can
    %                     be useful in order to increase readability
    %                     if many colors are ploted (using SCATTER
    %                     for example).
    %    ShowLabels (1) - (0/1) Controls wheter to display city/street textual labels on the map
    %    Language       - (string) A 2 letter ISO 639-1 language code for displaying labels in a local language instead of English (where available).
    %                     For example, for Chinese use:
    %                     plot_google_map('language','zh')
    %                     For the list of codes, see:
    %                     http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
    %    Marker         - The marker argument is a text string with fields
    %                     conforming to the Google Maps API. The
    %                     following are valid examples:
    %                     '43.0738740,-70.713993' (default midsize orange marker)
    %                     '43.0738740,-70.713993,blue' (midsize blue marker)
    %                     '43.0738740,-70.713993,yellowa' (midsize yellow
    %                     marker with label "A")
    %                     '43.0738740,-70.713993,tinyredb' (tiny red marker
    %                     with label "B")
    %    Refresh (1)    - (0/1) defines whether to automatically refresh the
    %                     map upon zoom/pan action on the figure.
    %    AutoAxis (1)   - (0/1) defines whether to automatically adjust the axis
    %                     of the plot to avoid the map being stretched.
    %                     This will adjust the span to be correct
    %                     according to the shape of the map axes.
    %    APIKey         - (string) set your own API key which you obtained from Google: 
    %                     http://developers.google.com/maps/documentation/staticmaps/#api_key
    %                     This will enable up to 25,000 map requests per day, 
    %                     compared to a few hundred requests without a key. 
    %                     To set the key, use:
    %                     plot_google_map('APIKey','SomeLongStringObtaindFromGoogle')
    %                     You need to do this only once to set the key.
    %                     To disable the use of a key, use:
    %                     plot_google_map('APIKey','')
    %
    % OUTPUT:
    %    h              - Handle to the plotted map
    %
    %    lonVect        - Vector of Longidute coordinates (WGS84) of the image 
    %    latVect        - Vector of Latidute coordinates (WGS84) of the image 
    %    imag           - Image matrix (height,width,3) of the map
    %
    % EXAMPLE - plot a map showing some capitals in Europe:
    %    lat = [48.8708   51.5188   41.9260   40.4312   52.523   37.982];
    %    lon = [2.4131    -0.1300    12.4951   -3.6788    13.415   23.715];
    %    plot(lon,lat,'.r','MarkerSize',20)
    %    plot_google_map
    %
    % References:
    % http://www.mathworks.com/matlabcentral/fileexchange/24113
    % http://www.maptiler.org/google-maps-coordinates-tile-bounds-projection/
    % http://developers.google.com/maps/documentation/staticmaps/
    %
    %  Acknowledgement to Val Schmidt for his submission of get_google_map.m
    %
    % Author:
    %  Zohar Bar-Yehuda
    %
    % Version 1.4 - 25/03/2014
    %       - Added the language parameter for showing labels in a local language
    %       - Display the URL on error to allow easier debugging of API errors
    % Version 1.3 - 06/10/2013
    %       - Improved functionality of AutoAxis, which now handles any shape of map axes. 
    %         Now also updates the extent of the map if the figure is resized.
    %       - Added the showLabels parameter which allows hiding the textual labels on the map.
    % Version 1.2 - 16/06/2012
    %       - Support use of the "scale=2" parameter by default for finer rendering (set scale=1 if too slow).
    %       - Auto-adjust axis extent so the map isn't stretched.
    %       - Set and use an API key which enables a much higher usage volume per day.
    % Version 1.1 - 25/08/2011

    % store parameters in global variable (used for auto-refresh)
    global inputParams
    persistent apiKey
    if isnumeric(apiKey)
        % first run, check if API key file exists
        if exist('api_key.mat','file')
            load api_key
        else
            apiKey = '';
        end
    end
    axHandle = gca;
    inputParams.(['ax' num2str(axHandle*1e6,'%.0f')]) = varargin;

    % Handle input arguments

    height = 640;
    width = 640;
    scale = 2;
    maptype = 'roadmap';
    alphaData = 1;
    autoRferesh = 1;
    autoAxis = 1;
    showLabels = 1;
    language = '';
    hold on

    markeridx = 1;
    markerlist = {};
    if nargin >= 2
        for idx = 1:2:length(varargin)
            switch lower(varargin{idx})
                case 'height'
                    height = varargin{idx+1};
                case 'width'
                    width = varargin{idx+1};
                case 'maptype'
                    maptype = varargin{idx+1};
                case 'alpha'
                    alphaData = varargin{idx+1};
                case 'refresh'
                    autoRferesh = varargin{idx+1};
                case 'showlabels'
                    showLabels = varargin{idx+1};
                case 'language'
                    language = varargin{idx+1};
                case 'marker'
                    markerlist{markeridx} = varargin{idx+1};
                    markeridx = markeridx + 1;
                case 'autoaxis'
                    autoAxis = varargin{idx+1};
                case 'apikey'
                    apiKey = varargin{idx+1}; % set new key
                    % save key to file
                    funcFile = which('plot_google_map.m');
                    pth = fileparts(funcFile);
                    keyFile = fullfile(pth,'api_key.mat');
                    save(keyFile,'apiKey')
                otherwise
                    error(['Unrecognized variable: ' varargin{idx}])
            end
        end
    end
    if height > 640
        height = 640;
    end
    if width > 640
        width = 640;
    end

    curAxis = axis;
    % Enforce Latitude constraints of EPSG:900913 
    if curAxis(3) < -85
        curAxis(3) = -85;
    end
    if curAxis(4) > 85
        curAxis(4) = 85;
    end
    % Enforce longitude constrains
    if curAxis(1) < -180
        curAxis(1) = -180;
    end
    if curAxis(1) > 180
        curAxis(1) = 0;
    end
    if curAxis(2) > 180
        curAxis(2) = 180;
    end
    if curAxis(2) < -180
        curAxis(2) = 0;
    end

    if isequal(curAxis,[0 1 0 1]) % probably an empty figure
        % display world map
        curAxis = [-200 200 -85 85];
        axis(curAxis)
    end


    if autoAxis
        % adjust current axis limit to avoid strectched maps
        [xExtent,yExtent] = latLonToMeters(curAxis(3:4), curAxis(1:2) );
        xExtent = diff(xExtent); % just the size of the span
        yExtent = diff(yExtent); 
        % get axes aspect ratio
        drawnow
        org_units = get(axHandle,'Units');
        set(axHandle,'Units','Pixels')
        ax_position = get(axHandle,'position');        
        set(axHandle,'Units',org_units)
        aspect_ratio = ax_position(4) / ax_position(3);

        if xExtent*aspect_ratio > yExtent        
            centerX = mean(curAxis(1:2));
            centerY = mean(curAxis(3:4));
            spanX = (curAxis(2)-curAxis(1))/2;
            spanY = (curAxis(4)-curAxis(3))/2;

            % enlarge the Y extent
            spanY = spanY*xExtent*aspect_ratio/yExtent; % new span
            if spanY > 85
                spanX = spanX * 85 / spanY;
                spanY = spanY * 85 / spanY;
            end
            curAxis(1) = centerX-spanX;
            curAxis(2) = centerX+spanX;
            curAxis(3) = centerY-spanY;
            curAxis(4) = centerY+spanY;
        elseif yExtent > xExtent*aspect_ratio

            centerX = mean(curAxis(1:2));
            centerY = mean(curAxis(3:4));
            spanX = (curAxis(2)-curAxis(1))/2;
            spanY = (curAxis(4)-curAxis(3))/2;
            % enlarge the X extent
            spanX = spanX*yExtent/(xExtent*aspect_ratio); % new span
            if spanX > 180
                spanY = spanY * 180 / spanX;
                spanX = spanX * 180 / spanX;
            end

            curAxis(1) = centerX-spanX;
            curAxis(2) = centerX+spanX;
            curAxis(3) = centerY-spanY;
            curAxis(4) = centerY+spanY;
        end            
        % Enforce Latitude constraints of EPSG:900913
        if curAxis(3) < -85
            curAxis(3:4) = curAxis(3:4) + (-85 - curAxis(3));
        end
        if curAxis(4) > 85
            curAxis(3:4) = curAxis(3:4) + (85 - curAxis(4));
        end
        axis(curAxis) % update axis as quickly as possible, before downloading new image
        drawnow
    end

    % Delete previous map from plot (if exists)
    if nargout <= 1 % only if in plotting mode
        curChildren = get(axHandle,'children');
        map_objs = findobj(curChildren,'tag','gmap');
        bd_callback = [];
        for idx = 1:length(map_objs)
            if ~isempty(get(map_objs(idx),'ButtonDownFcn'))
                % copy callback properties from current map
                bd_callback = get(map_objs(idx),'ButtonDownFcn');
            end
        end
        delete(map_objs)

    end

    % Calculate zoom level for current axis limits
    [xExtent,yExtent] = latLonToMeters(curAxis(3:4), curAxis(1:2) );
    minResX = diff(xExtent) / width;
    minResY = diff(yExtent) / height;
    minRes = max([minResX minResY]);
    tileSize = 256;
    initialResolution = 2 * pi * 6378137 / tileSize; % 156543.03392804062 for tileSize 256 pixels
    zoomlevel = floor(log2(initialResolution/minRes));

    % Enforce valid zoom levels
    if zoomlevel < 0 
        zoomlevel = 0;
    end
    if zoomlevel > 19 
        zoomlevel = 19;
    end

    % Calculate center coordinate in WGS1984
    lat = (curAxis(3)+curAxis(4))/2;
    lon = (curAxis(1)+curAxis(2))/2;

    % CONSTRUCT QUERY URL
    preamble = 'http://maps.googleapis.com/maps/api/staticmap';
    location = ['?center=' num2str(lat,10) ',' num2str(lon,10)];
    zoomStr = ['&zoom=' num2str(zoomlevel)];
    sizeStr = ['&scale=' num2str(scale) '&size=' num2str(width) 'x' num2str(height)];
    maptypeStr = ['&maptype=' maptype ];
    if ~isempty(apiKey)
        keyStr = ['&key=' apiKey];
    else
        keyStr = '';
    end
    markers = '&markers=';
    for idx = 1:length(markerlist)
        if idx < length(markerlist)
            markers = [markers markerlist{idx} '%7C'];
        else
            markers = [markers markerlist{idx}];
        end
    end
    if showLabels == 0
        labelsStr = '&style=feature:all|element:labels|visibility:off';
    else
        labelsStr = '';
    end
    if ~isempty(language)
        languageStr = ['&language=' language];
    else
        languageStr = '';
    end

    if ismember(maptype,{'satellite','hybrid'})
        filename = 'tmp.jpg';
        format = '&format=jpg';
        convertNeeded = 0;
    else
        filename = 'tmp.png';
        format = '&format=png';
        convertNeeded = 1;
    end
    sensor = '&sensor=false';
    url = [preamble location zoomStr sizeStr maptypeStr format markers labelsStr languageStr sensor keyStr];

    % Get the image
    try
        urlwrite(url,filename);
    catch % error downloading map
        warning(sprintf(['Unable to download map form Google Servers.\n' ...
            'Possible reasons: no network connection, quota exceeded, or some other error.\n' ...
            'Consider using an API key if quota problems persist.\n\n' ...
            'To debug, try pasting the following URL in your browser, which may result in a more informative error:\n%s'], url));
        varargout{1} = [];
        varargout{2} = [];
        varargout{3} = [];
        return
    end
    [M Mcolor] = imread(filename);
    M = cast(M,'double');
    delete(filename); % delete temp file
    width = size(M,2);
    height = size(M,1);

    % Calculate a meshgrid of pixel coordinates in EPSG:900913
    centerPixelY = round(height/2);
    centerPixelX = round(width/2);
    [centerX,centerY] = latLonToMeters(lat, lon ); % center coordinates in EPSG:900913
    curResolution = initialResolution / 2^zoomlevel/scale; % meters/pixel (EPSG:900913)
    xVec = centerX + ((1:width)-centerPixelX) * curResolution; % x vector
    yVec = centerY + ((height:-1:1)-centerPixelY) * curResolution; % y vector
    [xMesh,yMesh] = meshgrid(xVec,yVec); % construct meshgrid 

    % convert meshgrid to WGS1984
    [lonMesh,latMesh] = metersToLatLon(xMesh,yMesh);

    % We now want to convert the image from a colormap image with an uneven
    % mesh grid, into an RGB truecolor image with a uniform grid.
    % This would enable displaying it with IMAGE, instead of PCOLOR.
    % Advantages are:
    % 1) faster rendering
    % 2) makes it possible to display together with other colormap annotations (PCOLOR, SCATTER etc.)

    % Convert image from colormap type to RGB truecolor (if PNG is used)
    if convertNeeded
        imag = zeros(height,width,3);
        for idx = 1:3
            imag(:,:,idx) = reshape(Mcolor(M(:)+1+(idx-1)*size(Mcolor,1)),height,width);
        end
    else
        imag = M/255;
    end

    % Next, project the data into a uniform WGS1984 grid
    sizeFactor = 1; % factoring of new image
    uniHeight = round(height*sizeFactor);
    uniWidth = round(width*sizeFactor);
    latVect = linspace(latMesh(1,1),latMesh(end,1),uniHeight);
    lonVect = linspace(lonMesh(1,1),lonMesh(1,end),uniWidth);
    [uniLonMesh,uniLatMesh] = meshgrid(lonVect,latVect);
    uniImag = zeros(uniHeight,uniWidth,3);

    % old version (projection using INTERP2)
    % for idx = 1:3
    %      % 'nearest' method is the fastest. difference from other methods is neglible
    %          uniImag(:,:,idx) =  interp2(lonMesh,latMesh,imag(:,:,idx),uniLonMesh,uniLatMesh,'nearest');
    % end
    uniImag =  myTurboInterp2(lonMesh,latMesh,imag,uniLonMesh,uniLatMesh);

    if nargout <= 1 % plot map
        % display image
        h = image(lonVect,latVect,uniImag);    
        set(gca,'YDir','Normal')
        set(h,'tag','gmap')
        set(h,'AlphaData',alphaData)

        % add a dummy image to allow pan/zoom out to x2 of the image extent
        h_tmp = image(lonVect([1 end]),latVect([1 end]),zeros(2),'Visible','off');
        set(h_tmp,'tag','gmap')

        % older version (display without conversion to uniform grid)
        % h =pcolor(lonMesh,latMesh,(M));
        % colormap(Mcolor)
        % caxis([0 255])
        % warning off % to avoid strange rendering warnings
        % shading flat

        uistack(h,'bottom') % move map to bottom (so it doesn't hide previously drawn annotations)
        axis(curAxis) % restore original zoom
        if nargout == 1
            varargout{1} = h;
        end
        % if auto-refresh mode - override zoom callback to allow autumatic 
        % refresh of map upon zoom actions.
        zoomHandle = zoom;   
        panHandle = pan;    
        if autoRferesh        
            set(zoomHandle,'ActionPostCallback',@update_google_map);          
            set(panHandle, 'ActionPostCallback', @update_google_map);        
        else % disable zoom override
            set(zoomHandle,'ActionPostCallback',[]);
            set(panHandle, 'ActionPostCallback',[]);
        end

        % set callback for figure resize function, to update extents if figure
        % is streched.
        figHandle = get(axHandle,'Parent');
        set(figHandle, 'ResizeFcn', @update_google_map_fig);        

        % set callback properties 
        set(h,'ButtonDownFcn',bd_callback);
    else % don't plot, only return map
        varargout{1} = lonVect;
        varargout{2} = latVect;
        varargout{3} = uniImag;
    end
end

% Coordinate transformation functions

function [lon,lat] = metersToLatLon(x,y)
    % Converts XY point from Spherical Mercator EPSG:900913 to lat/lon in WGS84 Datum
    originShift = 2 * pi * 6378137 / 2.0; % 20037508.342789244
    lon = (x ./ originShift) * 180;
    lat = (y ./ originShift) * 180;
    lat = 180 / pi * (2 * atan( exp( lat * pi / 180)) - pi / 2);
end

function [x,y] = latLonToMeters(lat, lon )
    % Converts given lat/lon in WGS84 Datum to XY in Spherical Mercator EPSG:900913"
    originShift = 2 * pi * 6378137 / 2.0; % 20037508.342789244
    x = lon * originShift / 180;
    y = log(tan((90 + lat) * pi / 360 )) / (pi / 180);
    y = y * originShift / 180;
end

function ZI = myTurboInterp2(X,Y,Z,XI,YI)
    % An extremely fast nearest neighbour 2D interpolation, assuming both input
    % and output grids consist only of squares, meaning:
    % - uniform X for each column
    % - uniform Y for each row
    XI = XI(1,:);
    X = X(1,:);
    YI = YI(:,1);
    Y = Y(:,1);

    xiPos = nan*ones(size(XI));
    xLen = length(X);
    yiPos = nan*ones(size(YI));
    yLen = length(Y);
    % find x conversion
    xPos = 1;
    for idx = 1:length(xiPos)
        if XI(idx) >= X(1) && XI(idx) <= X(end)
            while xPos < xLen && X(xPos+1)<XI(idx)
                xPos = xPos + 1;
            end
            diffs = abs(X(xPos:xPos+1)-XI(idx));
            if diffs(1) < diffs(2)
                xiPos(idx) = xPos;
            else
                xiPos(idx) = xPos + 1;
            end
        end
    end
    % find y conversion
    yPos = 1;
    for idx = 1:length(yiPos)
        if YI(idx) <= Y(1) && YI(idx) >= Y(end)
            while yPos < yLen && Y(yPos+1)>YI(idx)
                yPos = yPos + 1;
            end
            diffs = abs(Y(yPos:yPos+1)-YI(idx));
            if diffs(1) < diffs(2)
                yiPos(idx) = yPos;
            else
                yiPos(idx) = yPos + 1;
            end
        end
    end
    ZI = Z(yiPos,xiPos,:);
end

function update_google_map(obj,evd)
    % callback function for auto-refresh
    drawnow;
    global inputParams
    if isfield(inputParams,['ax' num2str(gca*1e6,'%.0f')])
        params = inputParams.(['ax' num2str(gca*1e6,'%.0f')]);
        plot_google_map(params{:});
    end
end

function update_google_map_fig(obj,evd)
    % callback function for auto-refresh
    drawnow;
    global inputParams
    axes_objs = findobj(get(gcf,'children'),'type','axes');
    for idx = 1:length(axes_objs)
        if ~isempty(findobj(get(axes_objs(idx),'children'),'tag','gmap'));
            if isfield(inputParams,['ax' num2str(axes_objs(idx)*1e6,'%.0f')])
                params = inputParams.(['ax' num2str(axes_objs(idx)*1e6,'%.0f')]);
            else
                params = {};
            end
            axes(axes_objs(idx));
            plot_google_map(params{:});
            break;
        end
    end
end


%PARSE JHONSON
function data = parse_json2(string)
% DATA = PARSE_JSON(string)
% This function parses a JSON string and returns a cell array with the
% parsed data. JSON objects are converted to structures and JSON arrays are
% converted to cell arrays.

% F. Glineur, 2009
% (inspired by the JSON parser by Joel Feenstra on MATLAB File Exchange
% (http://www.mathworks.com/matlabcentral/fileexchange/20565) but with 
% faster handling of strings)

pos = 1;
len = length(string);
% String delimiters and escape characters are identified beforehand to improve speed
esc = regexp(string, '["\\]'); index_esc = 1; len_esc = length(esc);

if pos <= len
    switch(next_char)
        case '{'
            data = parse_object;
        case '['
            data = parse_array;
        otherwise
            error_pos('Outer level structure must be an object or an array');
    end
end

    function object = parse_object
        parse_char('{');
        object = [];
        if next_char ~= '}'
            while 1
                str = parse_string;
                if isempty(str)
                    error_pos('Name of value at position %d cannot be empty');
                end
                parse_char(':');
                val = parse_value;
                object.(valid_field(str)) = val;
                if next_char == '}'
                    break;
                end
                parse_char(',');
            end
        end
        parse_char('}');
    end

    function object = parse_array
        parse_char('[');
        object = cell(0, 1);
        if next_char ~= ']'
            while 1
                val = parse_value;
                object{end+1} = val;
                if next_char == ']'
                    break;
                end
                parse_char(',');
            end
        end
        parse_char(']');
    end

    function parse_char(c)
        skip_whitespace;
        if pos > len || string(pos) ~= c
            error_pos(sprintf('Expected %c at position %%d', c));
        else
            pos = pos + 1;
            skip_whitespace;
        end
    end

    function c = next_char
        skip_whitespace;
        if pos > len
            c = [];
        else
            c = string(pos);
        end        
    end
    
    function skip_whitespace
        while pos <= len && isspace(string(pos))
            pos = pos + 1;
        end
    end

     function str = parse_string
        if string(pos) ~= '"'
            error_pos('String starting with " expected at position %d');
        else
            pos = pos + 1;
        end
        str = '';
        while pos <= len
            while index_esc <= len_esc && esc(index_esc) < pos 
                index_esc = index_esc + 1;
            end
            if index_esc > len_esc
                str = [str string(pos:end)];
                pos = len + 1;
                break;
            else
                str = [str string(pos:esc(index_esc)-1)];
                pos = esc(index_esc);
            end
            switch string(pos)
                case '"' 
                    pos = pos + 1;
                    return;
                case '\'
                    if pos+1 > len
                        error_pos('End of file reached right after escape character');
                    end
                    pos = pos + 1;
                    switch string(pos)
                        case {'"' '\' '/'}
                            str(end+1) = string(pos);
                            pos = pos + 1;
                        case {'b' 'f' 'n' 'r' 't'}
                            str(end+1) = sprintf(['\' string(pos)]);
                            pos = pos + 1;
                        case 'u'
                            if pos+4 > len
                                error_pos('End of file reached in escaped unicode character');
                            end
                            str(end+1:end+6) = string(pos-1:pos+4);
                            pos = pos + 5;
                    end
                otherwise % should never happen
                    str(end+1) = string(pos);
                    pos = pos + 1;
            end
        end
        error_pos('End of file while expecting end of string');
    end

    function num = parse_number
        [num, one, err, delta] = sscanf(string(pos:min(len,pos+20)), '%f', 1); % TODO : compare with json(pos:end)
        if ~isempty(err)
            error_pos('Error reading number at position %d');
        end
        pos = pos + delta-1;
    end

    function val = parse_value
        switch(string(pos))
            case '"'
                val = parse_string;
                return;
            case '['
                val = parse_array;
                return;
            case '{'
                val = parse_object;
                return;
            case {'-','0','1','2','3','4','5','6','7','8','9'}
                val = parse_number;
                return;
            case 't'
                if pos+3 <= len && strcmpi(string(pos:pos+3), 'true')
                    val = true;
                    pos = pos + 4;
                    return;
                end
            case 'f'
                if pos+4 <= len && strcmpi(string(pos:pos+4), 'false')
                    val = false;
                    pos = pos + 5;
                    return;
                end
            case 'n'
                if pos+3 <= len && strcmpi(string(pos:pos+3), 'null')
                    val = [];
                    pos = pos + 4;
                    return;
                end
        end
        error_pos('Value expected at position %d');
    end

    function error_pos(msg)
        poss = max(min([pos-15 pos-1 pos pos+20],len),1);
        if poss(3) == poss(2)
            poss(3:4) = poss(2)+[0 -1];         % display nothing after
        end
        msg = [sprintf(msg, pos) ' : ... ' string(poss(1):poss(2)) '<error>' string(poss(3):poss(4)) ' ... '];
        ME = MException('JSONparser:invalidFormat', msg);
        throw(ME);
    end

    function str = valid_field(str)   
    % From MATLAB doc: field names must begin with a letter, which may be
    % followed by any combination of letters, digits, and underscores.
    % Invalid characters will be converted to underscores, and the prefix
    % "alpha_" will be added if first character is not a letter.
        if ~isletter(str(1))
            str = ['alpha_' str];
        end
        str(~isletter(str) & ~('0' <= str & str <= '9')) = '_';   
    end

end
