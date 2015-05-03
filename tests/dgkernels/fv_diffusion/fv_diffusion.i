[Mesh]
  type = GeneratedMesh
  dim = 1
  nx = 20
  ny = 10
  xmax = 10
[]

[Variables]
  [./u]
    order = CONSTANT
    family = MONOMIAL
    initial_condition = 1
  [../]
[]

[Kernels]
  active = 'force'
  [./diff]
    type = Diffusion
    variable = u
  [../]
  [./force]
    type = BodyForce
    variable = u
    value = 1
  [../]
[]

[DGKernels]
  [./neutron_diff]
    type = FVNeutronDiffusion
    variable = u
  [../]
[]

[BCs]
  [./left]
    type = FVVacuumBC
    variable = u
    boundary = left
  [../]
  [./right]
    type = FVVacuumBC
    variable = u
    boundary = right
  [../]
[]

[Materials]
  [./constant_mat]
    type = GenericConstantMaterial
    block = 0
    prop_names = diffusivity
    prop_values = 1
  [../]
[]

[Executioner]
  type = Steady
  solve_type = NEWTON
  petsc_options_iname = '-pc_type -pc_hypre_type'
  petsc_options_value = 'hypre boomeramg'
[]

[Outputs]
  output_initial = true
  exodus = true
  print_linear_residuals = true
  print_perf_log = true
[]
