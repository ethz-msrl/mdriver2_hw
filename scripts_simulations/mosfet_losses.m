%MOSFET turnon and turnoff losses
Rgon=3+2.7+1.08;      %MOSFET gate resistance plus source resistance of driver
Rgoff=3+2.7+0.6;      %MOSFET gate resistance plus sink resistance of driver
Ciss=7.2e-9;        %input capacitance of MOSFET
VGS=12;             %steady state gate source voltage
Vth=3.5;            %threshold voltage of the MOSFET
Vgp=5.2;            %gate plateau voltage
Cgd=30e-12;         %Cgd=Crss
Vds=400;
Ids=20;
fsw=5e3;
Qrr=5e-6;
Rds=24e-3;

t1=Rgon*Ciss*log(1/(1-Vth/VGS));
t2=Rgon*Ciss*log(1/(1-Vgp/VGS));
t3=Rgon*Cgd*Vds/(VGS-Vgp);

Eturnon=0.5*((t2-t1)+t3)*Vds*Ids;

Err=Qrr*Vds*0.5;

t4=Rgoff*Ciss*log(VGS/Vgp);
t5=Rgoff*Cgd*Vds/Vgp;
t6=Rgoff*Ciss*log(Vgp/Vth);

Eturnoff=0.5*(t5+t6)*Vds*Ids;

Psw=fsw*(Eturnon+Eturnoff+Err);
Pcond=Rds*Ids^2;

Ptot=Psw+Pcond;

%electromagnet related parameters
Rem=5;

%ripple current through AC capacitor
ils=linspace(0,20,10);
ds=0.5+Rem*ils/(2*400);
icdcs=(2*ds-1).*ils;
icacs=sqrt(ils.^2-icdcs.^2);
%capacitance value required
T=1/fsw;
alpha=4e-2;
Cdc=T*Ids/(2*alpha*Vds);