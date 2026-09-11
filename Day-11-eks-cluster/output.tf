output "cluster_name" { // Output for cluster name
  value = aws_eks_cluster.mycluster.name 
}

output "cluster_endpoint" {
    value = aws_eks_cluster.mycluster.mycluste.endpoint
}