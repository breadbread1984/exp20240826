:begin
CREATE CONSTRAINT UNIQUE_IMPORT_NAME FOR (node:`UNIQUE IMPORT LABEL`) REQUIRE (node.`UNIQUE IMPORT ID`) IS UNIQUE;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{_id:1, properties:{name:"Oxide-based Ceramics"}}, {_id:2, properties:{name:"Phosphate-based Ceramics"}}, {_id:3, properties:{name:"Sulfide-based Ceramics"}}, {_id:4, properties:{name:"Nitride-based Ceramics"}}, {_id:5, properties:{name:"Fluoride-based Ceramics"}}, {_id:6, properties:{name:"Borate-based Ceramics"}}, {_id:7, properties:{name:"Silicate-based Ceramics"}}, {_id:8, properties:{name:"Carbonate-based Ceramics"}}, {_id:9, properties:{name:"Composite Ceramics"}}, {_id:10, properties:{name:"Perovskite-type Ceramics"}}, {_id:11, properties:{name:"Garnet-type Ceramics"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:InorganicCeramicElectrolyte;
UNWIND [{_id:158, properties:{name:"Lanthanum Lithium Oxide", formula:"LaLiO3"}}, {_id:159, properties:{name:"Lanthanum Strontium Titanate", formula:"La0.8Sr0.2TiO3"}}, {_id:160, properties:{name:"Strontium Titanate", formula:"SrTiO3"}}, {_id:161, properties:{name:"Lithium Lanthanum Titanate", formula:"LiLaTiO3"}}, {_id:162, properties:{name:"Lithium Lanthanum Zirconate", formula:"LiLaZrO3"}}, {_id:163, properties:{name:"Lithium Niobate", formula:"LiNbO3"}}, {_id:164, properties:{name:"Lanthanum Strontium Manganite", formula:"La0.8Sr0.2MnO3"}}, {_id:165, properties:{name:"Lithium Lanthanum Manganese Titanate", formula:"Li3-xLa3-x/2Mn2+2x/3TiO3"}}, {_id:166, properties:{name:"Lithium Lanthanum Nickel Oxide", formula:"LiLaNiO3"}}, {_id:167, properties:{name:"Lanthanum Lithium Cobalt Oxide", formula:"LaLiCoO3"}}, {_id:168, properties:{name:"Lithium Lanthanum Tantalate", formula:"LiLaTaO3"}}, {_id:169, properties:{name:"Lithium Lanthanum Gallate", formula:"LiLaGaO3"}}, {_id:170, properties:{name:"Lithium Lanthanum Zinc Oxide", formula:"LiLaZnO3"}}, {_id:171, properties:{name:"Lithium Lanthanum Magnesium Oxide", formula:"LiLaMgO3"}}, {_id:172, properties:{name:"Lithium Lanthanum Iron Oxide", formula:"LiLaFeO3"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:PerovskiteTypeCeramics;
UNWIND [{_id:173, properties:{name:"Lithium Lanthanum Zirconate", formula:"Li7La3Zr2O12 (LLZO)"}}, {_id:174, properties:{name:"Lithium Lanthanum Zirconium Tantalum Oxide", formula:"Li6.6La3Zr1.6Ta0.4O12 (LLZTO)"}}, {_id:175, properties:{name:"Lithium Lanthanum Zirconium Tantalum Oxide", formula:"Li6.4La3Zr1.4Ta0.6O12 (LLZT)"}}, {_id:176, properties:{name:"Lithium Lanthanum Niobium Oxide", formula:"Li7La3Nb2O12 (LLNO)"}}, {_id:177, properties:{name:"Lithium Perovskite Lanthanum Zirconium Antimony Oxide", formula:"Li7-xPexLa3Zr2-xSbxO12 (LPESZO)"}}, {_id:178, properties:{name:"Lithium Lanthanum Gallium Zinc Oxide", formula:"Li7La3Ga5-xZnxO12 (LLGZO)"}}, {_id:179, properties:{name:"Lithium Lanthanum Gallium Magnesium Oxide", formula:"Li7La3Ga5-xMgxO12 (LLGMO)"}}, {_id:180, properties:{name:"Lithium Strontium Lanthanum Zirconium Tantalum Oxide", formula:"Li7-xSrxLa3Zr2-xTaxO12 (LSLZO)"}}, {_id:181, properties:{name:"Lithium Calcium Lanthanum Zirconium Tantalum Oxide", formula:"Li7-xCaxLa3Zr2-xTaxO12 (LCLZO)"}}, {_id:182, properties:{name:"Lithium Barium Lanthanum Zirconium Tantalum Oxide", formula:"Li7-xBaxLa3Zr2-xTaxO12 (LBLZO)"}}, {_id:183, properties:{name:"Lithium Strontium Lanthanum Zirconium Tantalum Oxide", formula:"Li7-xSrxLa3-x/2Zr2-x/2TaxO12 (SLZTO)"}}, {_id:184, properties:{name:"Lithium Calcium Lanthanum Zirconium Tantalum Oxide", formula:"Li7-xCaxLa3-x/2Zr2-x/2TaxO12 (CLZTO)"}}, {_id:185, properties:{name:"Lithium Barium Lanthanum Zirconium Tantalum Oxide", formula:"Li7-xBaxLa3-x/2Zr2-x/2TaxO12 (BLZTO)"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:GarnetTypeCeramics;
UNWIND [{_id:138, properties:{name:"Lithium Lanthanum Zirconium Oxide + Glass-ceramics", formula:"LLZO (Li7La3Zr2O12) + Glass-ceramics"}}, {_id:139, properties:{name:"Lithium Lanthanum Zirconium Oxide + Polymer", formula:"LLZO + Polymer (e.g., PEO, PVDF)"}}, {_id:140, properties:{name:"Lithium Aluminum Germanium Phosphate + Polymer", formula:"LAGP (LiAlGe(PO4)3) + Polymer"}}, {_id:141, properties:{name:"NASICON-type Sodium Zirconium Silicophosphate + Polymer", formula:"NASICON (Na1+xZr2SixP3−xO12) + Polymer"}}, {_id:142, properties:{name:"Garnet-type + Polymer", formula:"Garnet-type + Polymer"}}, {_id:143, properties:{name:"Oxide Ceramic + Sulfide Ceramic", formula:"Oxide Ceramic + Sulfide Ceramic"}}, {_id:144, properties:{name:"Oxide Ceramic + Glass", formula:"Oxide Ceramic + Glass"}}, {_id:145, properties:{name:"Oxide Ceramic + Carbon Nanotubes (CNTs)", formula:"Oxide Ceramic + Carbon Nanotubes (CNTs)"}}, {_id:146, properties:{name:"Oxide Ceramic + Graphene", formula:"Oxide Ceramic + Graphene"}}, {_id:147, properties:{name:"Sulfide Ceramic + Polymer", formula:"Sulfide Ceramic + Polymer"}}, {_id:148, properties:{name:"Sulfide Ceramic + CNTs", formula:"Sulfide Ceramic + CNTs"}}, {_id:149, properties:{name:"Sulfide Ceramic + Graphene", formula:"Sulfide Ceramic + Graphene"}}, {_id:150, properties:{name:"Nitride Ceramic + Polymer", formula:"Nitride Ceramic + Polymer"}}, {_id:151, properties:{name:"Fluoride Ceramic + Polymer", formula:"Fluoride Ceramic + Polymer"}}, {_id:152, properties:{name:"Borate Ceramic + Polymer", formula:"Borate Ceramic + Polymer"}}, {_id:153, properties:{name:"Silicate Ceramic + Polymer", formula:"Silicate Ceramic + Polymer"}}, {_id:154, properties:{name:"Carbonate Ceramic + Polymer", formula:"Carbonate Ceramic + Polymer"}}, {_id:155, properties:{name:"Oxide Ceramic + Sulfide Ceramic + Polymer", formula:"Oxide Ceramic + Sulfide Ceramic + Polymer"}}, {_id:156, properties:{name:"Oxide Ceramic + Nitride Ceramic + Polymer", formula:"Oxide Ceramic + Nitride Ceramic + Polymer"}}, {_id:157, properties:{name:"Sulfide Ceramic + Nitride Ceramic + Polymer", formula:"Sulfide Ceramic + Nitride Ceramic + Polymer"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:CompositeCeramics;
UNWIND [{_id:29, properties:{name:"Lithium Aluminum Titanium Phosphate", formula:"Li1.3Al0.3Ti1.7(PO4)3 (LATP)"}}, {_id:30, properties:{name:"Aluminum-doped Lithium Aluminum Titanium Phosphate", formula:"Li1.4Al0.4Ti1.6(PO4)3 (Al-doped LATP)"}}, {_id:31, properties:{name:"Lithium Aluminum Germanium Phosphate", formula:"Li1+xAlxGe2-x(PO4)3 (LAGP)"}}, {_id:32, properties:{name:"Lithium Iron Phosphate", formula:"LiFePO4 (LFP)"}}, {_id:33, properties:{name:"Lithium Manganese Phosphate", formula:"LiMnPO4 (LMP)"}}, {_id:34, properties:{name:"Lithium Magnesium Phosphate", formula:"LiMg2(PO4)2"}}, {_id:35, properties:{name:"Lithium Calcium Pyrophosphate", formula:"Li2CaP2O7"}}, {_id:36, properties:{name:"Lithium Zinc Phosphate", formula:"Li2Zn(PO4)2"}}, {_id:37, properties:{name:"Lithium Magnesium Silicate", formula:"Li2MgSi2O7"}}, {_id:38, properties:{name:"Lithium Calcium Silicate", formula:"Li2CaSi2O7"}}, {_id:39, properties:{name:"Lithium Calcium Germanate", formula:"Li2CaGe2O7"}}, {_id:40, properties:{name:"Lithium Calcium Titanate", formula:"Li2CaTi2O7"}}, {_id:41, properties:{name:"Lithium Calcium Zirconate", formula:"Li2CaZr2O7"}}, {_id:42, properties:{name:"Lithium Vanadium Phosphate", formula:"Li3V2(PO4)3 (LVP)"}}, {_id:43, properties:{name:"Lithium Calcium Vanadate", formula:"Li2CaVO4"}}, {_id:44, properties:{name:"Lithium Calcium Molybdate", formula:"Li2CaMoO4"}}, {_id:45, properties:{name:"Lithium Calcium Tungstate", formula:"Li2CaWO4"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:PhosphateBasedCeramics;
UNWIND [{_id:46, properties:{name:"Lithium Sulfide-Phosphorus Pentasulfide", formula:"Li2S-P2S5"}}, {_id:47, properties:{name:"Lithium Sulfide-Phosphorus Sulfide", formula:"Li2S-PS4"}}, {_id:48, properties:{name:"Lithium Sulfide-Silicon Sulfide", formula:"Li2S-SiS2"}}, {_id:49, properties:{name:"Lithium Sulfide-Germanium Sulfide", formula:"Li2S-GeS2"}}, {_id:50, properties:{name:"Lithium Sulfide-Bismuth Sulfide", formula:"Li2S-Bi2S3"}}, {_id:51, properties:{name:"Lithium Sulfide-Gallium Sulfide", formula:"Li2S-Ga2S3"}}, {_id:52, properties:{name:"Lithium Sulfide-Indium Sulfide", formula:"Li2S-In2S3"}}, {_id:53, properties:{name:"Lithium Sulfide-Zinc Sulfide", formula:"Li2S-ZnS"}}, {_id:54, properties:{name:"Lithium Sulfide-Cadmium Sulfide", formula:"Li2S-CdS"}}, {_id:55, properties:{name:"Lithium Sulfide-Lead Sulfide", formula:"Li2S-PbS"}}, {_id:56, properties:{name:"Lithium Sulfide-Tin Disulfide", formula:"Li2S-SnS2"}}, {_id:57, properties:{name:"Lithium Thiophosphate", formula:"Li3PS4"}}, {_id:58, properties:{name:"Lithium Germanium Phosphorus Sulfide", formula:"Li10GeP2S12 (LGPS)"}}, {_id:59, properties:{name:"Lithium Silicon Phosphorus Sulfide", formula:"Li10SiP2S12 (LSPS)"}}, {_id:60, properties:{name:"Lithium Germanium Tin Phosphorus Sulfide", formula:"Li10Ge1-xSnxP2S12 (LGSPS)"}}, {_id:61, properties:{name:"Lithium Thiophosphate Halide", formula:"Li6PS5X (where X = Cl, Br, I)"}}, {_id:62, properties:{name:"Lithium Sulfide-Zirconium Disulfide", formula:"Li2S-ZrS2"}}, {_id:63, properties:{name:"Lithium Sulfide-Titanium Disulfide", formula:"Li2S-TiS2"}}, {_id:64, properties:{name:"Lithium Sulfide-Hafnium Disulfide", formula:"Li2S-HfS2"}}, {_id:65, properties:{name:"Lithium Sulfide-Tantalum Disulfide", formula:"Li2S-TaS2"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:SulfideBasedCeramics;
UNWIND [{_id:66, properties:{name:"Lithium Sulfide-Niobium Disulfide", formula:"Li2S-NbS2"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:SulfideBasedCeramics;
UNWIND [{_id:80, properties:{name:"Lithium Fluoride", formula:"LiF"}}, {_id:81, properties:{name:"Lithium Gallium Fluoride", formula:"LiGaF4"}}, {_id:82, properties:{name:"Lithium Aluminum Fluoride", formula:"Li3AlF6"}}, {_id:83, properties:{name:"Lithium Lanthanum Titanium Oxyfluoride", formula:"LiLa2Ti2O4F"}}, {_id:84, properties:{name:"Lithium Scandium Fluoride", formula:"LiScF4"}}, {_id:85, properties:{name:"Lithium Scandium Fluoride", formula:"Li3ScF6"}}, {_id:86, properties:{name:"Lithium Yttrium Fluoride", formula:"LiYF4"}}, {_id:87, properties:{name:"Lithium Yttrium Fluoride", formula:"Li3YF6"}}, {_id:88, properties:{name:"Lithium Zirconium Fluoride", formula:"Li2ZrF6"}}, {_id:89, properties:{name:"Lithium Tantalum Fluoride", formula:"Li3TaF6"}}, {_id:90, properties:{name:"Lithium Niobium Fluoride", formula:"Li3NbF6"}}, {_id:91, properties:{name:"Lithium Tin Fluoride", formula:"Li2SnF6"}}, {_id:92, properties:{name:"Lithium Germanium Fluoride", formula:"Li2GeF6"}}, {_id:93, properties:{name:"Lithium Titanium Fluoride", formula:"Li2TiF6"}}, {_id:94, properties:{name:"Lithium Tetrafluoroborate", formula:"LiBF4"}}, {_id:95, properties:{name:"Lithium Hexafluorophosphate", formula:"LiPF6"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:FluorideBasedCeramics;
UNWIND [{_id:111, properties:{name:"Tetralithium Orthosilicate", formula:"Li4SiO4"}}, {_id:112, properties:{name:"Lithium Metasilicate", formula:"Li2SiO3"}}, {_id:113, properties:{name:"Lithium Disilicate", formula:"Li2Si2O5"}}, {_id:114, properties:{name:"Lithium Aluminum Silicate", formula:"LiAlSiO4"}}, {_id:115, properties:{name:"Dilithium Magnesium Disilicate", formula:"Li2MgSi2O6"}}, {_id:116, properties:{name:"Dilithium Calcium Disilicate", formula:"Li2CaSi2O6"}}, {_id:117, properties:{name:"Dilithium Strontium Disilicate", formula:"Li2SrSi2O6"}}, {_id:118, properties:{name:"Dilithium Barium Disilicate", formula:"Li2BaSi2O6"}}, {_id:119, properties:{name:"Dilithium Zinc Disilicate", formula:"Li2ZnSi2O6"}}, {_id:120, properties:{name:"Dilithium Copper Disilicate", formula:"Li2CuSi2O6"}}, {_id:121, properties:{name:"Dilithium Iron Disilicate", formula:"Li2FeSi2O6"}}, {_id:122, properties:{name:"Dilithium Nickel Disilicate", formula:"Li2NiSi2O6"}}, {_id:123, properties:{name:"Dilithium Cobalt Disilicate", formula:"Li2CoSi2O6"}}, {_id:124, properties:{name:"Dilithium Titanium Disilicate", formula:"Li2TiSi2O6"}}, {_id:125, properties:{name:"Dilithium Vanadium Disilicate", formula:"Li2VSi2O6"}}, {_id:126, properties:{name:"Dilithium Chromium Disilicate", formula:"Li2CrSi2O6"}}, {_id:127, properties:{name:"Dilithium Manganese Disilicate", formula:"Li2MnSi2O6"}}, {_id:128, properties:{name:"Trilithium Disilicate", formula:"Li2LiSi2O6"}}, {_id:129, properties:{name:"Dilithium Aluminum Silicate", formula:"Li2AlSiO5"}}, {_id:130, properties:{name:"Dilithium Germanium Disilicate", formula:"Li2GeSi2O6"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:SilicateBasedCeramics;
UNWIND [{_id:12, properties:{name:"Lithium Orthosilicate", formula:"Li4SiO4"}}, {_id:13, properties:{name:"Lithium Lanthanum Zirconium Oxide", formula:"Li7La3Zr2O12 (LLZO)"}}, {_id:14, properties:{name:"Lithium Aluminum Titanium Phosphate", formula:"Li1.3Al0.3Ti1.7(PO4)3 (LATP)"}}, {_id:15, properties:{name:"Lithium Aluminum Titanium Phosphate", formula:"Li1.4Al0.4Ti1.6(PO4)3"}}, {_id:16, properties:{name:"Lithium Aluminum Germanium Phosphate", formula:"Li1+xAlxGe2-x(PO4)3 (LAGP)"}}, {_id:17, properties:{name:"Lithium Vanadium Phosphate", formula:"Li3V2(PO4)3 (LVP)"}}, {_id:18, properties:{name:"Lithium Indium Titanium Phosphate", formula:"Li1.5In0.5Ti1.5(PO4)3 (LITP)"}}, {_id:19, properties:{name:"Lithium Magnesium Titanium Oxide", formula:"LiMg2Ti3O8 (LMT)"}}, {_id:20, properties:{name:"Lithium Zirconate", formula:"Li2ZrO3"}}, {_id:21, properties:{name:"Lithium Titanate", formula:"Li2TiO3"}}, {_id:22, properties:{name:"Lithium Niobate", formula:"LiNbO3"}}, {_id:23, properties:{name:"Lithium Tantalate", formula:"LiTaO3"}}, {_id:24, properties:{name:"Lithium Borate", formula:"Li3BO3"}}, {_id:25, properties:{name:"Lithium Carbonate", formula:"Li2CO3"}}, {_id:26, properties:{name:"Lithium Aluminate", formula:"LiAlO2"}}, {_id:27, properties:{name:"Li3YCl6", formula:"Li3YCl6"}}, {_id:28, properties:{name:"Lithium Yttrium Bromide", formula:"Li3YBr6"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:OxideBasedCeramics;
UNWIND [{_id:96, properties:{name:"Lithium Tetraborate", formula:"Li2B4O7"}}, {_id:97, properties:{name:"Dilithium Dodecaborate", formula:"Li2B12O19"}}, {_id:98, properties:{name:"Dilithium Hexaborate", formula:"Li2B6O11"}}, {_id:99, properties:{name:"Dilithium Decaborate Chloride", formula:"Li2B10O17Cl"}}, {_id:100, properties:{name:"Lithium Triborate", formula:"LiB3O5"}}, {_id:101, properties:{name:"Dilithium Dodecaborate Bromide", formula:"Li2B12O17Br"}}, {_id:102, properties:{name:"Lithium Metaborate", formula:"LiB3O6"}}, {_id:103, properties:{name:"Dilithium Dodecaborate Iodide", formula:"Li2B12O18I"}}, {_id:104, properties:{name:"Dilithium Dodecaborate Fluoride", formula:"Li2B12O17F"}}, {_id:105, properties:{name:"Dilithium Dodecaborate Hydroxide", formula:"Li2B12O17OH"}}, {_id:106, properties:{name:"Dilithium Dodecaborate", formula:"Li2B12O17(NH4)"}}, {_id:107, properties:{name:"Dilithium Sodium Dodecaborate", formula:"Li2B12O17Na"}}, {_id:108, properties:{name:"Li2B12O17K", formula:"Li2B12O17K"}}, {_id:109, properties:{name:"Lithium Pentaborate", formula:"LiB5O9"}}, {_id:110, properties:{name:"Dilithium Dodecaborate Tetraoxide", formula:"Li2B12O21"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:BorateBasedCeramics;
UNWIND [{_id:67, properties:{name:"Lithium Nitride", formula:"Li3N"}}, {_id:68, properties:{name:"Lithium Aluminum Nitride", formula:"LiAlN"}}, {_id:69, properties:{name:"Lithium Silicon Nitride", formula:"Li2SiN2"}}, {_id:70, properties:{name:"Lithium Boron Nitride", formula:"Li3BN2"}}, {_id:71, properties:{name:"Lithium Gallium Nitride", formula:"LiGaN2"}}, {_id:72, properties:{name:"Lithium Aluminum Nitride", formula:"Li3AlN2"}}, {_id:73, properties:{name:"Lithium Magnesium Nitride", formula:"Li2MgN2"}}, {_id:74, properties:{name:"Lithium Silicon Nitride", formula:"Li3SiN4"}}, {_id:75, properties:{name:"Lithium Zirconium Nitride", formula:"Li2ZrN2"}}, {_id:76, properties:{name:"Lithium Titanium Nitride", formula:"Li2TiN2"}}, {_id:77, properties:{name:"Lithium Vanadium Nitride", formula:"Li2VN2"}}, {_id:78, properties:{name:"Lithium Tin Nitride", formula:"Li2SnN2"}}, {_id:79, properties:{name:"Lithium Germanium Nitride", formula:"Li2GeN2"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:NitrideBasedCeramics;
UNWIND [{_id:131, properties:{name:"Lithium Carbonate", formula:"Li2CO3"}}, {_id:132, properties:{name:"Sodium Carbonate", formula:"Na2CO3"}}, {_id:133, properties:{name:"Potassium Carbonate", formula:"K2CO3"}}, {_id:134, properties:{name:"Magnesium Carbonate", formula:"MgCO3"}}, {_id:135, properties:{name:"Calcium Carbonate", formula:"CaCO3"}}, {_id:136, properties:{name:"Strontium Carbonate", formula:"SrCO3"}}, {_id:137, properties:{name:"Barium Carbonate", formula:"BaCO3"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:CarbonateBasedCeramics;
UNWIND [{_id:0, properties:{name:"Inorganic Ceramic Electrolyte"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:SolidStateElectrolyte;
:commit
:begin
UNWIND [{start: {_id:173}, end: {_id:11}, properties:{}}, {start: {_id:174}, end: {_id:11}, properties:{}}, {start: {_id:175}, end: {_id:11}, properties:{}}, {start: {_id:176}, end: {_id:11}, properties:{}}, {start: {_id:177}, end: {_id:11}, properties:{}}, {start: {_id:178}, end: {_id:11}, properties:{}}, {start: {_id:179}, end: {_id:11}, properties:{}}, {start: {_id:180}, end: {_id:11}, properties:{}}, {start: {_id:181}, end: {_id:11}, properties:{}}, {start: {_id:182}, end: {_id:11}, properties:{}}, {start: {_id:183}, end: {_id:11}, properties:{}}, {start: {_id:184}, end: {_id:11}, properties:{}}, {start: {_id:185}, end: {_id:11}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:80}, end: {_id:5}, properties:{}}, {start: {_id:81}, end: {_id:5}, properties:{}}, {start: {_id:82}, end: {_id:5}, properties:{}}, {start: {_id:83}, end: {_id:5}, properties:{}}, {start: {_id:84}, end: {_id:5}, properties:{}}, {start: {_id:85}, end: {_id:5}, properties:{}}, {start: {_id:86}, end: {_id:5}, properties:{}}, {start: {_id:87}, end: {_id:5}, properties:{}}, {start: {_id:88}, end: {_id:5}, properties:{}}, {start: {_id:89}, end: {_id:5}, properties:{}}, {start: {_id:90}, end: {_id:5}, properties:{}}, {start: {_id:91}, end: {_id:5}, properties:{}}, {start: {_id:92}, end: {_id:5}, properties:{}}, {start: {_id:93}, end: {_id:5}, properties:{}}, {start: {_id:94}, end: {_id:5}, properties:{}}, {start: {_id:95}, end: {_id:5}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:131}, end: {_id:8}, properties:{}}, {start: {_id:132}, end: {_id:8}, properties:{}}, {start: {_id:133}, end: {_id:8}, properties:{}}, {start: {_id:134}, end: {_id:8}, properties:{}}, {start: {_id:135}, end: {_id:8}, properties:{}}, {start: {_id:136}, end: {_id:8}, properties:{}}, {start: {_id:137}, end: {_id:8}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:1}, end: {_id:0}, properties:{}}, {start: {_id:2}, end: {_id:0}, properties:{}}, {start: {_id:3}, end: {_id:0}, properties:{}}, {start: {_id:4}, end: {_id:0}, properties:{}}, {start: {_id:5}, end: {_id:0}, properties:{}}, {start: {_id:6}, end: {_id:0}, properties:{}}, {start: {_id:7}, end: {_id:0}, properties:{}}, {start: {_id:8}, end: {_id:0}, properties:{}}, {start: {_id:9}, end: {_id:0}, properties:{}}, {start: {_id:10}, end: {_id:0}, properties:{}}, {start: {_id:11}, end: {_id:0}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:29}, end: {_id:2}, properties:{}}, {start: {_id:30}, end: {_id:2}, properties:{}}, {start: {_id:31}, end: {_id:2}, properties:{}}, {start: {_id:32}, end: {_id:2}, properties:{}}, {start: {_id:33}, end: {_id:2}, properties:{}}, {start: {_id:34}, end: {_id:2}, properties:{}}, {start: {_id:35}, end: {_id:2}, properties:{}}, {start: {_id:36}, end: {_id:2}, properties:{}}, {start: {_id:37}, end: {_id:2}, properties:{}}, {start: {_id:38}, end: {_id:2}, properties:{}}, {start: {_id:39}, end: {_id:2}, properties:{}}, {start: {_id:40}, end: {_id:2}, properties:{}}, {start: {_id:41}, end: {_id:2}, properties:{}}, {start: {_id:42}, end: {_id:2}, properties:{}}, {start: {_id:43}, end: {_id:2}, properties:{}}, {start: {_id:44}, end: {_id:2}, properties:{}}, {start: {_id:45}, end: {_id:2}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:46}, end: {_id:3}, properties:{}}, {start: {_id:47}, end: {_id:3}, properties:{}}, {start: {_id:48}, end: {_id:3}, properties:{}}, {start: {_id:49}, end: {_id:3}, properties:{}}, {start: {_id:50}, end: {_id:3}, properties:{}}, {start: {_id:51}, end: {_id:3}, properties:{}}, {start: {_id:52}, end: {_id:3}, properties:{}}, {start: {_id:53}, end: {_id:3}, properties:{}}, {start: {_id:54}, end: {_id:3}, properties:{}}, {start: {_id:55}, end: {_id:3}, properties:{}}, {start: {_id:56}, end: {_id:3}, properties:{}}, {start: {_id:57}, end: {_id:3}, properties:{}}, {start: {_id:58}, end: {_id:3}, properties:{}}, {start: {_id:59}, end: {_id:3}, properties:{}}, {start: {_id:60}, end: {_id:3}, properties:{}}, {start: {_id:61}, end: {_id:3}, properties:{}}, {start: {_id:62}, end: {_id:3}, properties:{}}, {start: {_id:63}, end: {_id:3}, properties:{}}, {start: {_id:64}, end: {_id:3}, properties:{}}, {start: {_id:65}, end: {_id:3}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:66}, end: {_id:3}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:138}, end: {_id:9}, properties:{}}, {start: {_id:139}, end: {_id:9}, properties:{}}, {start: {_id:140}, end: {_id:9}, properties:{}}, {start: {_id:141}, end: {_id:9}, properties:{}}, {start: {_id:142}, end: {_id:9}, properties:{}}, {start: {_id:143}, end: {_id:9}, properties:{}}, {start: {_id:144}, end: {_id:9}, properties:{}}, {start: {_id:145}, end: {_id:9}, properties:{}}, {start: {_id:146}, end: {_id:9}, properties:{}}, {start: {_id:147}, end: {_id:9}, properties:{}}, {start: {_id:148}, end: {_id:9}, properties:{}}, {start: {_id:149}, end: {_id:9}, properties:{}}, {start: {_id:150}, end: {_id:9}, properties:{}}, {start: {_id:151}, end: {_id:9}, properties:{}}, {start: {_id:152}, end: {_id:9}, properties:{}}, {start: {_id:153}, end: {_id:9}, properties:{}}, {start: {_id:154}, end: {_id:9}, properties:{}}, {start: {_id:155}, end: {_id:9}, properties:{}}, {start: {_id:156}, end: {_id:9}, properties:{}}, {start: {_id:157}, end: {_id:9}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:158}, end: {_id:10}, properties:{}}, {start: {_id:159}, end: {_id:10}, properties:{}}, {start: {_id:160}, end: {_id:10}, properties:{}}, {start: {_id:161}, end: {_id:10}, properties:{}}, {start: {_id:162}, end: {_id:10}, properties:{}}, {start: {_id:163}, end: {_id:10}, properties:{}}, {start: {_id:164}, end: {_id:10}, properties:{}}, {start: {_id:165}, end: {_id:10}, properties:{}}, {start: {_id:166}, end: {_id:10}, properties:{}}, {start: {_id:167}, end: {_id:10}, properties:{}}, {start: {_id:168}, end: {_id:10}, properties:{}}, {start: {_id:169}, end: {_id:10}, properties:{}}, {start: {_id:170}, end: {_id:10}, properties:{}}, {start: {_id:171}, end: {_id:10}, properties:{}}, {start: {_id:172}, end: {_id:10}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:96}, end: {_id:6}, properties:{}}, {start: {_id:97}, end: {_id:6}, properties:{}}, {start: {_id:98}, end: {_id:6}, properties:{}}, {start: {_id:99}, end: {_id:6}, properties:{}}, {start: {_id:100}, end: {_id:6}, properties:{}}, {start: {_id:101}, end: {_id:6}, properties:{}}, {start: {_id:102}, end: {_id:6}, properties:{}}, {start: {_id:103}, end: {_id:6}, properties:{}}, {start: {_id:104}, end: {_id:6}, properties:{}}, {start: {_id:105}, end: {_id:6}, properties:{}}, {start: {_id:106}, end: {_id:6}, properties:{}}, {start: {_id:107}, end: {_id:6}, properties:{}}, {start: {_id:108}, end: {_id:6}, properties:{}}, {start: {_id:109}, end: {_id:6}, properties:{}}, {start: {_id:110}, end: {_id:6}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:12}, end: {_id:1}, properties:{}}, {start: {_id:13}, end: {_id:1}, properties:{}}, {start: {_id:14}, end: {_id:1}, properties:{}}, {start: {_id:15}, end: {_id:1}, properties:{}}, {start: {_id:16}, end: {_id:1}, properties:{}}, {start: {_id:17}, end: {_id:1}, properties:{}}, {start: {_id:18}, end: {_id:1}, properties:{}}, {start: {_id:19}, end: {_id:1}, properties:{}}, {start: {_id:20}, end: {_id:1}, properties:{}}, {start: {_id:21}, end: {_id:1}, properties:{}}, {start: {_id:22}, end: {_id:1}, properties:{}}, {start: {_id:23}, end: {_id:1}, properties:{}}, {start: {_id:24}, end: {_id:1}, properties:{}}, {start: {_id:25}, end: {_id:1}, properties:{}}, {start: {_id:26}, end: {_id:1}, properties:{}}, {start: {_id:27}, end: {_id:1}, properties:{}}, {start: {_id:28}, end: {_id:1}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:67}, end: {_id:4}, properties:{}}, {start: {_id:68}, end: {_id:4}, properties:{}}, {start: {_id:69}, end: {_id:4}, properties:{}}, {start: {_id:70}, end: {_id:4}, properties:{}}, {start: {_id:71}, end: {_id:4}, properties:{}}, {start: {_id:72}, end: {_id:4}, properties:{}}, {start: {_id:73}, end: {_id:4}, properties:{}}, {start: {_id:74}, end: {_id:4}, properties:{}}, {start: {_id:75}, end: {_id:4}, properties:{}}, {start: {_id:76}, end: {_id:4}, properties:{}}, {start: {_id:77}, end: {_id:4}, properties:{}}, {start: {_id:78}, end: {_id:4}, properties:{}}, {start: {_id:79}, end: {_id:4}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:111}, end: {_id:7}, properties:{}}, {start: {_id:112}, end: {_id:7}, properties:{}}, {start: {_id:113}, end: {_id:7}, properties:{}}, {start: {_id:114}, end: {_id:7}, properties:{}}, {start: {_id:115}, end: {_id:7}, properties:{}}, {start: {_id:116}, end: {_id:7}, properties:{}}, {start: {_id:117}, end: {_id:7}, properties:{}}, {start: {_id:118}, end: {_id:7}, properties:{}}, {start: {_id:119}, end: {_id:7}, properties:{}}, {start: {_id:120}, end: {_id:7}, properties:{}}, {start: {_id:121}, end: {_id:7}, properties:{}}, {start: {_id:122}, end: {_id:7}, properties:{}}, {start: {_id:123}, end: {_id:7}, properties:{}}, {start: {_id:124}, end: {_id:7}, properties:{}}, {start: {_id:125}, end: {_id:7}, properties:{}}, {start: {_id:126}, end: {_id:7}, properties:{}}, {start: {_id:127}, end: {_id:7}, properties:{}}, {start: {_id:128}, end: {_id:7}, properties:{}}, {start: {_id:129}, end: {_id:7}, properties:{}}, {start: {_id:130}, end: {_id:7}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
:commit
:begin
MATCH (n:`UNIQUE IMPORT LABEL`)  WITH n LIMIT 20000 REMOVE n:`UNIQUE IMPORT LABEL` REMOVE n.`UNIQUE IMPORT ID`;
:commit
:begin
DROP CONSTRAINT UNIQUE_IMPORT_NAME;
:commit
