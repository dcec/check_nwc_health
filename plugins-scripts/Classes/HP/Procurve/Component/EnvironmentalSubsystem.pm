package Classes::HP::Procurve::Component::EnvironmentalSubsystem;
our @ISA = qw(Monitoring::GLPlugin::SNMP::Item);
use strict;

sub init {
  my ($self) = @_;
  if ($self->implements_mib('HP-ICF-CHASSIS-MIB')) {
    $self->analyze_and_check_sensor_subsystem('Classes::HP::Procurve::Component::SensorSubsystem');
  } else {
    $self->analyze_and_check_environmental_subsystem("Classes::ENTITYSENSORMIB::Component::EnvironmentalSubsystem");
  }
  if (! $self->check_messages()) {
    $self->add_ok("environmental hardware working fine");
  }
}


