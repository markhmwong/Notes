/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
public class Codec {
    //Encodes a tree to a single string.
    public String serialize(TreeNode root) {
    
        if (root == null) {
            return "";
        }
        ArrayList<TreeNode> nodeQ = new ArrayList<TreeNode>();
        ArrayList<Integer> arrList = new ArrayList<Integer>();
        StringBuilder sb = new StringBuilder();
        TreeNode currNode = null;
    
        nodeQ.add(root);
        arrList.add(root.val);
        sb.append(root.val).append(",");
        while(!nodeQ.isEmpty()) {
            currNode = nodeQ.get(0);
    
            sb.append(treeNodeCheck(currNode.left, nodeQ)).append(',');
            sb.append(treeNodeCheck(currNode.right, nodeQ)).append(',');
            nodeQ.remove(0);
        }
        return sb.toString();
    }
    
    public Integer treeNodeCheck(TreeNode node, ArrayList<TreeNode> nodeQ) {
        if (node != null) {
            nodeQ.add(node);
            return node.val;
        } else {
            return null;
        }
    }
    
    
    public TreeNode deserialize(String data) {
        if (data.equals("null") || data.length() == 0) {
            return null;
        }
        ArrayList<String> listVal = new ArrayList<String>();
        ArrayList<TreeNode> nodeQ = new ArrayList<TreeNode>();
    
        listVal.addAll(Arrays.asList(data.split(",")));
    
        TreeNode root = new TreeNode(Integer.valueOf(listVal.get(0)));
        nodeQ.add(root);
        listVal.remove(0);
        TreeNode currNode = null;
    
        while (listVal.size() > 0  && nodeQ.size() > 0) {
            currNode = nodeQ.get(0);
            if (currNode != null) {
                if (listVal.get(0).equals("null")) {
                    currNode.left = null;
                } else {
                    currNode.left = new TreeNode(Integer.valueOf(listVal.get(0)));
                }
                nodeQ.add(currNode.left);
                listVal.remove(0);
    
                //since we're just removed a value from the list above - listVal.remove(0);
                //we have to make sure the value ahead of the top of the queue is not out of range
                if (listVal.size() > 1) {
                    if (listVal.get(0).equals("null")) {
                        currNode.right = null;
                    } else {
                        currNode.right = new TreeNode(Integer.valueOf(listVal.get(0)));
                    }
                    nodeQ.add(currNode.right);
                    listVal.remove(0);
                }
            }
            nodeQ.remove(0);
        }
        return root;
    }
}

// Your Codec object will be instantiated and called as such:
// Codec codec = new Codec();
// codec.deserialize(codec.serialize(root));
