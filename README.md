# Singularity Analysis of a Hybrid Serial-Cable Driven Planar Robot

**Author**: Mourad

## Project Overview
This project implements the singularity analysis of a hybrid serial-cable driven planar robot as described in the research paper `ajeassp.2022.197.208.pdf`. The implementation focuses on identifying and analyzing singular configurations where the robot loses degrees of freedom or becomes uncontrollable.

## Robot Configuration
<!-- TODO: Update with specific robot parameters from the paper -->
- **Serial joints**: [Number and types]
- **Cable drives**: [Number of cables and attachment points]
- **Degrees of freedom**: [Total DOF]
- **Workspace**: Planar (2D) motion

## Mathematical Framework

### 1. Forward Kinematics
The forward kinematics relates joint variables to end-effector position:

```
x = f(q, l)
```

Where:
- `x` = End-effector position vector [x, y, θ]
- `q` = Serial joint variables vector
- `l` = Cable length vector

<!-- TODO: Add specific forward kinematics equations from the paper -->

### 2. Jacobian Matrix
The Jacobian matrix relates joint velocities to end-effector velocities:

```
ẋ = J(q, l) * [q̇; l̇]
```

The complete Jacobian can be partitioned as:
```
J = [Jq | Jl]
```

Where:
- `Jq` = Jacobian with respect to serial joints
- `Jl` = Jacobian with respect to cable lengths

#### Serial Joint Jacobian (Jq)
```
Jq = ∂f/∂q
```
<!-- TODO: Add specific Jq equations -->

#### Cable Jacobian (Jl)  
```
Jl = ∂f/∂l
```
<!-- TODO: Add specific Jl equations -->

### 3. Singularity Conditions

#### Type 1 Singularities (Serial Chain Singularities)
Occur when the serial chain reaches a singular configuration:
```
det(Jq) = 0
```

#### Type 2 Singularities (Cable Singularities)
Occur when cables become linearly dependent:
```
rank(Jl) < min(m, n)
```
Where m = number of cables, n = DOF

#### Type 3 Singularities (Combined Singularities)
Occur when the complete Jacobian loses rank:
```
rank(J) < n
```

### 4. Singularity Analysis Methods

#### Method 1: Determinant Analysis
For square Jacobians:
```
det(J) = 0
```

#### Method 2: Singular Value Decomposition (SVD)
```
J = U * Σ * V^T
```
Singularities occur when min(Σ) ≈ 0

#### Method 3: Condition Number
```
κ(J) = σ_max / σ_min
```
High condition numbers indicate near-singular configurations.

## Implementation Plan

### Phase 1: Kinematic Modeling
- [ ] Define robot parameters and configuration
- [ ] Implement forward kinematics functions
- [ ] Validate kinematic model with test cases

### Phase 2: Jacobian Computation
- [ ] Implement serial joint Jacobian (Jq)
- [ ] Implement cable Jacobian (Jl)
- [ ] Combine Jacobians into complete matrix J

### Phase 3: Singularity Detection
- [ ] Implement determinant-based singularity detection
- [ ] Implement SVD-based analysis
- [ ] Implement condition number monitoring

### Phase 4: Workspace Analysis
- [ ] Generate workspace grid
- [ ] Identify singular boundaries
- [ ] Visualize singularity map

### Phase 5: Validation and Testing
- [ ] Compare with analytical solutions (if available)
- [ ] Test edge cases and boundary conditions
- [ ] Performance optimization

## File Structure
```
├── README.md                 # This file
├── requirements.txt          # Python dependencies
├── src/
│   ├── __init__.py
│   ├── robot_model.py       # Robot kinematic model
│   ├── jacobian.py          # Jacobian computation
│   ├── singularity.py       # Singularity analysis
│   └── visualization.py     # Plotting and visualization
├── examples/
│   ├── basic_analysis.py    # Basic singularity analysis
│   ├── workspace_map.py     # Workspace singularity mapping
│   └── trajectory_check.py  # Trajectory singularity checking
├── tests/
│   ├── test_kinematics.py   # Unit tests for kinematics
│   ├── test_jacobian.py     # Unit tests for Jacobian
│   └── test_singularity.py  # Unit tests for singularity analysis
└── data/
    ├── robot_params.json    # Robot configuration parameters
    └── test_trajectories/   # Sample trajectories for testing
```

## Dependencies
- numpy: Numerical computations
- scipy: Scientific computing and optimization
- matplotlib: Plotting and visualization
- sympy: Symbolic mathematics
- pandas: Data handling
- jupyter: Interactive development (optional)

## Installation
```bash
# Activate virtual environment
.\.venv\Scripts\Activate.ps1

# Install dependencies
pip install -r requirements.txt
```

## Usage Examples

### Basic Singularity Check
```python
from src.robot_model import HybridRobot
from src.singularity import SingularityAnalyzer

robot = HybridRobot(config_file='data/robot_params.json')
analyzer = SingularityAnalyzer(robot)

# Check if configuration is singular
q = [0.5, 1.0, 0.3]  # joint angles
l = [1.2, 1.5, 1.8]  # cable lengths
is_singular = analyzer.is_singular(q, l)
```

### Workspace Analysis
```python
from src.visualization import WorkspaceVisualizer

visualizer = WorkspaceVisualizer(robot)
visualizer.plot_singularity_map()
visualizer.show()
```

## Key Equations to Implement
<!-- Update these with the specific equations from your paper -->

1. **Robot Configuration Equations**
   - Joint coordinate transformations
   - Cable routing geometry
   - End-effector position

2. **Jacobian Elements**
   - Partial derivatives ∂x/∂q_i
   - Partial derivatives ∂x/∂l_j
   - Chain rule applications

3. **Singularity Metrics**
   - Determinant calculation
   - SVD computation
   - Condition number evaluation

## Research Paper Reference
- Title: [Add full title from the paper]
- Authors: 
- Journal: AJEASSP 2022
- Pages: 197-208
- DOI: 

## Notes
- All angles in radians unless specified
- All lengths in meters unless specified
- Coordinate system: [Define coordinate system from paper]

## TODO
- [ ] Extract specific equations from the research paper
- [ ] Define exact robot parameters and configuration
- [ ] Add detailed mathematical derivations
- [ ] Include validation benchmarks from the paper