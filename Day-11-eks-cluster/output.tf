output = "cluster_name" {
    value = aws_eks_cluster.myscluster.name
}

output "cluster_endpoint" {
    value = aws_eks_cluster.mycluster.mycluste.endpoint
}