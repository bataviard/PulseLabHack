<?php
 class PriorityQueue extends SplPriorityQueue
{
    public function compare($p1, $p2) {
        if ($p1 == $p2) {
			return 0;
		}
		else {
            return ($p1 < $p2) ? 1 : -1;
		}
  }
}

 class Dijkstra
{
    protected $graph;

    public function __construct($graph) {
        $this->graph = $graph;
    }

    public function shortestPath($source, $target) {
        // initialize Q, d and pi for all vertices
        $d = array();  // array of best estimates of shortest path to each vertex
        $pi = array(); // array of predecessors for each vertex
        $Q = new SplPriorityQueue(); // queue of all unoptimized vertices

        foreach ($this->graph as $v => $adj) {
            $d[$v] = INF; // set initial distance to "infinity"
            $pi[$v] = null; // no known predecessors yet
            foreach ($adj as $w => $cost) {
                // use the edge cost as the priority
                $Q->insert($w, $cost);
            }
        }

        // initial distance at source is 0
        $d[$source] = 0;

        while (!$Q->isEmpty()) {
            // extract min cost
            $u = $Q->extract();
            if (!empty($this->graph[$u])) {
                // "relax" each adjacent vertex
                foreach ($this->graph[$u] as $v => $cost) {
                    // alternate route length to adjacent neighbor
                    $alt = $d[$u] + $cost;
                    // if alternate route is shorter
                    if ($alt < $d[$v]) {
                        $d[$v] = $alt; // update minimum length to vertex
                        $pi[$v] = $u;  // add neighbor to predecessors for vertex
                    }
                }
            }
        }

        // we can now find the shortest path using reverse iteration
        $S = new SplStack(); // construct the shortest path with a stack S
        $u = $target;
        $dist = 0;
        // traverse from target to source
        while (isset($pi[$u]) && $pi[$u]) {
            $S->push($u);
            $dist += $this->graph[$u][$pi[$u]];  // add distance to next predecessor
            $u = $pi[$u];
        }

        // stack will be empty if there is no route back
        if ($S->isEmpty()) {
            echo "No route from $source to $target\n";
        }
        else {
            // add the source node and print the path in reverse (LIFO) order
            $S->push($source);
            //echo "$dist:";
            $sep = '';
            foreach ($S as $v) {
                //echo $sep, $v;
                $sep = '->';
                
            }
          //echo "\n";
        }
        
        return $S;
    }
}

//$g->shortestPath('F1', 'A11');  // 3:D->E->C
//$g->shortestPath('F1', 'A1');  // 3:D->E->C
//$g->shortestPath('D13', 'F1');  // 6:C->E->D->A
//$g->shortestPath('B', 'F');  // 3:B->D->F
//$g->shortestPath('F', 'A');  // 5:F->D->A 
//$g->shortestPath('A', 'G');  // No route from A to G