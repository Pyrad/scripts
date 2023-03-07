def graham_scan(points):
    """
    This is an algorithm suggested by New Bing with ChatGPT!
    Pyrad
    2023-03-07
    """
    # Find the lowest point
    min_idx = None
    for i, (x, y) in enumerate(points):
        if min_idx == None or y < points[min_idx][1]:
            min_idx = i
        if y == points[min_idx][1] and x < points[min_idx][0]:
            min_idx = i

    # Put lowest point at first position
    points[0], points[min_idx] = points[min_idx], points[0]

    # Sort points by polar angle with lowest point
    def polar_angle(p0, p1=None):
        if p1 == None:
            p1 = anchor
        y_span = p0[1] - p1[1]
        x_span = p0[0] - p1[0]
        return math.atan2(y_span, x_span)

    def distance(p0, p1=None):
        if p1 == None:
            p1 = anchor
        y_span = p0[1] - p1[1]
        x_span = p0[0] - p1[0]
        return y_span ** 2 + x_span ** 2

    anchor = points[0]
    sorted_points = sorted(points[1:], key=lambda x: (polar_angle(x), -distance(x)))

    # Check if sorted list is a polygon or just a line
    a = polar_angle(sorted_points[0], anchor)
    b = polar_angle(sorted_points[-1], anchor)
    if a == b:
        # All points are collinear
        return [anchor, sorted_points[-1]]

    # Create stack with first two sorted points and anchor
    stack = [anchor, sorted_points[0], sorted_points[1]]

    # Run Graham scan on remaining points
    for s in sorted_points[2:]:
        while det(stack[-2], stack[-1], s) <= 0:
            stack.pop()
        stack.append(s)

    return stack

def det(p_01: tuple[int,int],p_02: tuple[int,int],p_03: tuple[int,int]) -> int:
   """Return determinant value."""
   return (p_02.x-p_01.x)*(p_03.y-p_01.y)-(p_02.y-p_01.y)*(p_03.x-p_01.x)
