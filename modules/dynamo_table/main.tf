resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name                        = var.name
  billing_mode                = var.billing_mode
  read_capacity               = var.read_capacity
  write_capacity              = var.write_capacity
  hash_key                    = var.hash_key
  deletion_protection_enabled = var.deletion_protection_enabled

  lifecycle {
    ignore_changes = [
      read_capacity,
      write_capacity,
    ]
  }

  dynamic "attribute" {
    for_each = var.attributes
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }


  dynamic "global_secondary_index" {
    for_each = var.global_secondary_index
    content {
      name               = global_secondary_index.value.name
      hash_key           = global_secondary_index.value.hash_key
      range_key          = global_secondary_index.value.range_key
      write_capacity     = global_secondary_index.value.write_capacity
      read_capacity      = global_secondary_index.value.read_capacity
      projection_type    = global_secondary_index.value.projection_type
      non_key_attributes = global_secondary_index.value.non_key_attributes
    }
  }

  dynamic "ttl" {
    for_each = var.ttl
    content {
      attribute_name = ttl.value.attribute_name
      enabled        = ttl.value.enabled
    }
  }


  tags = var.tags
}

resource "aws_appautoscaling_target" "dynamodb_table_read_target" {
  max_capacity       = 100
  min_capacity       = var.read_capacity
  resource_id        = "table/${var.name}"
  scalable_dimension = "dynamodb:table:ReadCapacityUnits"
  service_namespace  = "dynamodb"

}

resource "aws_appautoscaling_policy" "dynamodb_table_read_policy" {
  name               = "DynamoDBReadCapacityUtilization:${aws_appautoscaling_target.dynamodb_table_read_target.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.dynamodb_table_read_target.resource_id
  scalable_dimension = aws_appautoscaling_target.dynamodb_table_read_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.dynamodb_table_read_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBReadCapacityUtilization"
    }

    target_value = 70
  }
}

resource "aws_appautoscaling_target" "dynamodb_table_write_target" {
  max_capacity       = 100
  min_capacity       = var.write_capacity
  resource_id        = "table/${var.name}"
  scalable_dimension = "dynamodb:table:WriteCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "dynamodb_table_write_policy" {
  name               = "DynamoDBWriteCapacityUtilization:${aws_appautoscaling_target.dynamodb_table_write_target.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.dynamodb_table_write_target.resource_id
  scalable_dimension = aws_appautoscaling_target.dynamodb_table_write_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.dynamodb_table_write_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBWriteCapacityUtilization"
    }

    target_value = 70
  }
}


resource "aws_appautoscaling_target" "dynamodb_table_read_target_index" {
    count           = length(var.global_secondary_index)
    max_capacity       = 200
    min_capacity       = var.global_secondary_index[count.index].read_capacity
    resource_id        = "table/${var.name}/index/${var.global_secondary_index[count.index].name}"
    scalable_dimension = "dynamodb:index:ReadCapacityUnits"
    service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "dynamodb_table_read_policy_index" {
    count           = length(var.global_secondary_index)
    name               = "DynamoDBReadCapacityUtilization:${aws_appautoscaling_target.dynamodb_table_read_target_index[count.index].resource_id}"
    policy_type        = "TargetTrackingScaling"
    resource_id        = aws_appautoscaling_target.dynamodb_table_read_target_index[count.index].resource_id
    scalable_dimension = aws_appautoscaling_target.dynamodb_table_read_target_index[count.index].scalable_dimension
    service_namespace  = aws_appautoscaling_target.dynamodb_table_read_target_index[count.index].service_namespace

    target_tracking_scaling_policy_configuration {
        predefined_metric_specification {
        predefined_metric_type = "DynamoDBReadCapacityUtilization"
        }

        target_value = 70
    }
}

resource "aws_appautoscaling_target" "dynamodb_table_write_target_index" {
    count           = length(var.global_secondary_index)
    max_capacity       = 200
    min_capacity       = var.global_secondary_index[count.index].write_capacity
    resource_id        = "table/${var.name}/index/${var.global_secondary_index[count.index].name}"
    scalable_dimension = "dynamodb:index:WriteCapacityUnits"
    service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "dynamodb_table_write_policy_index" {
    count           = length(var.global_secondary_index)
    name               = "DynamoDBWriteCapacityUtilization:${aws_appautoscaling_target.dynamodb_table_write_target_index[count.index].resource_id}"
    policy_type        = "TargetTrackingScaling"
    resource_id        = aws_appautoscaling_target.dynamodb_table_write_target_index[count.index].resource_id
    scalable_dimension = aws_appautoscaling_target.dynamodb_table_write_target_index[count.index].scalable_dimension
    service_namespace  = aws_appautoscaling_target.dynamodb_table_write_target_index[count.index].service_namespace

    target_tracking_scaling_policy_configuration {
        predefined_metric_specification {
        predefined_metric_type = "DynamoDBWriteCapacityUtilization"
        }

        target_value = 70
    }
}
